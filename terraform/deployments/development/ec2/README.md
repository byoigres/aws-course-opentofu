# EC2

## Connect to the instance

### Using the script

```sh
./connect-to-ec2.sh
```

### Manually

#### Get the private cert

```sh
terragrunt output private_key_openssh | sed '1d;$d' > ~/.ssh/aws_ec2_my_first_instance    
```

#### Apply the necessary permissions

```sh
chmod 600 ~/.ssh/aws_ec2_my_first_instance
```

#### Get the instance public IP

```sh
terragrunt output ec2_public_ip | sed 's/"//g'
```

#### Connect

```sh
ssh -i ~/.ssh/aws_ec2_my_first_instance ec2-user@<IP>
```