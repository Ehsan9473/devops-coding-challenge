provider "google" {
  project = "devops-coding-challenge-446411"
  region  = "us-central1"
}

resource "google_sql_database_instance" "postgres_instance" {
  name             = "postgres-instance"
  database_version = "POSTGRES_13"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "postgres_db" {
  name     = "postgres"
  instance = google_sql_database_instance.postgres_instance.name
}

resource "google_sql_user" "postgres_user" {
  name     = "myuser"
  instance = google_sql_database_instance.postgres_instance.name
  password = "P@ssw0rd!2023"
}
