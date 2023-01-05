resource "aws_db_instance" "development" {
  identifier = "mysql"
  allocated_storage         = 5
  backup_retention_period   = 2
  backup_window             = "01:00-01:30"
  maintenance_window        = "sun:03:00-sun:03:30" 
  multi_az                  = true
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t2.micro"
  name                      = "worker_db" 
  username                  = "worker"
  password                  = var.db_password
  port                      = "3306"
  publicly_accessible       = true
  skip_final_snapshot       = true
  delete_automated_backups  = false


}
