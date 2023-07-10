resource "null_resource" "import_backup" {
  provisioner "local-exec" {
    command = <<EOT
      gcloud auth activate-service-account --key-file=creds.json
      echo Y | gcloud sql import sql instance1 gs://backupandrestoredborasql/DB1.bak --database=db1 --quiet
      echo Y | gcloud sql import sql instance1 gs://backupandrestoredborasql/DB2.bak --database=db2 --quiet
      echo Y | gcloud sql import sql instance1 gs://backupandrestoredborasql/DB3.bak --database=db3 --quiet  
    EOT
}
}
