Content-Type: multipart/mixed; boundary="==BOUNDARY=="
MIME-Version: 1.0

--==BOUNDARY==
Content-Type: text/x-shellscript; charset="us-ascii"

#!/bin/bash
# Specify the cluster that the container instance should register into
cluster=dot-nrd-dev-sfi-biodb-ecs-ec2-cluster

# Write the cluster configuration variable to the ecs.config file
# (add any other configuration variables here also)
echo ECS_CLUSTER=$cluster >> /etc/ecs/ecs.config

START_TASK_SCRIPT_FILE="/etc/ecs/ecs-start-task.sh"
cat <<- 'EOF' > ${START_TASK_SCRIPT_FILE}
	exec 2>>/var/log/ecs/ecs-start-task.log
	set -x
	
	# Install prerequisite tools
	yum install -y jq aws-cli
	
	# Wait for the ECS service to be responsive
	until curl -s http://localhost:51678/v1/metadata
	do
		sleep 1
	done

	# Grab the container instance ARN and AWS Region from instance metadata
	instance_mac=$(curl -s http://169.254.169.254/latest/meta-data/mac)
	instance_subnet=$(curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$instance_mac/subnet-id)
	instance_security_group=$(curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$instance_mac/security-group-ids)
	instance_arn=$(curl -s http://localhost:51678/v1/metadata | jq -r '. | .ContainerInstanceArn' | awk -F/ '{print $NF}' )
	cluster=$(curl -s http://localhost:51678/v1/metadata | jq -r '. | .Cluster' | awk -F/ '{print $NF}' )
	region=$(curl -s http://localhost:51678/v1/metadata | jq -r '. | .ContainerInstanceArn' | awk -F: '{print $4}')

	# Specify the task definition to run at launch
	task_definition=dot-nrd-dev-sfi-biodb-task-definition-ec2

	# Run the AWS CLI start-task command to start your task on this container instance
	# need network parameter if using awsvpc mode --network-configuration "awsvpcConfiguration={subnets=[$instance_subnet],securityGroups=[$instance_security_group]}"
	aws ecs start-task --cluster $cluster --task-definition $task_definition --container-instances $instance_arn  --started-by $instance_arn --region $region
EOF

# Write systemd unit file
UNIT="ecs-start-task.service"
cat <<- EOF > /etc/systemd/system/${UNIT}
      [Unit]
      Description=ECS Start Task
      Requires=ecs.service
      After=ecs.service
 
      [Service]
      Restart=on-failure
      RestartSec=30
      ExecStart=/usr/bin/bash ${START_TASK_SCRIPT_FILE}

      [Install]
      WantedBy=default.target
EOF

# Enable our ecs.service dependent service with `--no-block` to prevent systemd deadlock
# See https://github.com/aws/amazon-ecs-agent/issues/1707
systemctl enable --now --no-block "${UNIT}"
--==BOUNDARY==--