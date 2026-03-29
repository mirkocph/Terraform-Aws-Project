output "alb_dns_name" {
  description = "DNS del Load Balancer"
  value       = aws_lb.main.dns_name
}

output "rds_endpoint" {
  description = "Endpoint del database RDS"
  value       = aws_db_instance.main.endpoint
}

output "vpc_id" {
  description = "ID del VPC"
  value       = aws_vpc.main.id
}