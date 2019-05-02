resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.example-instance.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

user_data = <<-EOF
#!/bin/bash
set -x
apt-get update -y
apt-get upgrade -y
curl -fsSL https://get.docker.com/ | sh
mkdir /home/ubuntu/Test
mkdir /home/ubuntu/wordpress
cd /home/ubuntu/wordpress
docker run -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=wordpress --name wordpressdb -v "$PWD/database":/var/lib/mysql -d mariadb:latest
docker pull wordpress
docker run -e WORDPRESS_DB_PASSWORD=root --name wordpress --link wordpressdb:mysql -p 80:80 -v "$PWD/html":/var/www/html -d wordpress
mkdir /home/ubuntu/End
-EOF
}
