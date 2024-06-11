resource "aws_instance" "wordpress-ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id
  associate_public_ip_address = true

user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd 
              amazon-linux-extras install -y php7.2
              yum install -y httpd mysql php php-mysqlnd wget
              systemctl start httpd
              systemctl enable httpd
              cd /var/www/html
              wget https://wordpress.org/latest.tar.gz
              tar -xzf latest.tar.gz
              cp -r wordpress/* .
              rm -rf wordpress latest.tar.gz
              chown -R apache:apache /var/www/html
              chmod -R 755 /var/www/html
              cp wp-config-sample.php wp-config.php
              sed -i "s/database_name_here/mydb/" wp-config.php  # Update database name
              sed -i "s/username_here/admin/" wp-config.php
              sed -i "s/password_here/adminadmin/" wp-config.php
              sed -i "s/localhost/${var.rds_endpoint}/" wp-config.php
              systemctl restart httpd
              EOF


  tags = {
    Name = "wordpress-ec2"
  }
}

output "instance_id" {
  value = aws_instance.wordpress-ec2.id
}

output "public_ip" {
  value = aws_instance.wordpress-ec2.public_ip
}