output "remote_public_ip" {
  value = "${aws_instance.remote.public_ip}"
}

output "remote_private_ip" {
  value = "${aws_instance.remote.private_ip}"
}

output "www1_private_ip" {
  value = "${aws_instance.www1.private_ip}"
}

output "www2_private_ip" {
  value = "${aws_instance.www2.private_ip}"
}

