# Capture the private key content
private_key=$(terragrunt output private_key_openssh | sed '1d;$d')

# Create a temporary file
temp_key_file=$(mktemp)

# Ensure the temporary file is removed on exit or interruption
trap 'rm -f "$temp_key_file"' EXIT

# Write the private key content to the temporary file
echo "$private_key" > "$temp_key_file"

# Set the appropriate permissions for the temporary key file
chmod 600 "$temp_key_file"

# Use the temporary key file with ssh
ssh -i "$temp_key_file" ec2-user@$(terragrunt output ec2_public_ip | sed 's/"//g')

# The temporary key file will be deleted automatically due to the trap command
