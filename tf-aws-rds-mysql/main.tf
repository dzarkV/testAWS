
# Security group

resource "aws_security_group" "sg_mysql5" {
  name        = "sg_mysql5"
  description = "Allow MySQL inbound traffic"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# RDS instace

resource "aws_db_instance" "mysql_test_ws2" {
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t2.micro"

    storage_type = "gp2"
    allocated_storage = 20
    identifier = "mysql-test-workshop"

    db_name = "msqltest"

    username = var.username_db
    password = var.password_db

    skip_final_snapshot = true
    multi_az = false
    backup_retention_period = 0
    delete_automated_backups = true
    performance_insights_enabled = false
    publicly_accessible = true

    vpc_security_group_ids = [aws_security_group.sg_mysql5.id]

    tags = {
        project: "workshop-mysql"
        montored_by: "Jacobo" 
    }

}