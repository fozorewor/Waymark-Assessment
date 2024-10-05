#!/bin/bash
# Update the system
sudo yum update -y

# Install required packages
sudo yum install -y wget unzip

# Download HashiCorp Vault
VAULT_VERSION="1.14.0"  
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip

# Unzip the Vault binary
unzip vault_${VAULT_VERSION}_linux_amd64.zip

# Move the binary to /usr/local/bin
sudo mv vault /usr/local/bin/

# Ensure Vault is executable
sudo chmod +x /usr/local/bin/vault

# Create a directory for Vault
sudo mkdir -p /etc/vault.d

# Create a Vault configuration file
sudo tee /etc/vault.d/vault.hcl <<EOF
backend "file" {
  path = "/var/lib/vault/data"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1  # Disable TLS for development purposes
}

# Enable the API
api_addr = "http://127.0.0.1:8200"
EOF

# Create the data directory
sudo mkdir -p /var/lib/vault/data
sudo chown -R $(whoami):$(whoami) /var/lib/vault

# Create a systemd service for Vault
sudo tee /etc/systemd/system/vault.service <<EOF
[Unit]
Description=HashiCorp Vault
Documentation=https://www.vaultproject.io/docs/
Requires=network-online.target
After=network-online.target

[Service]
User=$(whoami)
Group=$(whoami)
ExecStart=/usr/local/bin/vault server -config=/etc/vault.d/vault.hcl
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Start and enable the Vault service
sudo systemctl start vault
sudo systemctl enable vault
