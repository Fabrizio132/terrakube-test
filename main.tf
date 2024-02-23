provider "aws" {
  region                   = "us-west-2"              #Regione da utilizzare
  shared_credentials_files = "$HOME/.aws/credentials" # path con il file delle credenziali
  profile                  = "default"                #Il profilo da utilizzare per accedere ad AWS. Il profilo default deve essere configurato in "./.aws/credentials"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = " MY - VPC"
  }
}
