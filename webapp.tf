module "app" {
  source = "./deployment"
  application_name = "example-webapp"
  application_version = "c341f5c"
  artifact_bucket = "demo-project.springboot.simple-artifacts"
  worker_ami = "ami-0989fb15ce71ba39e"
  instance_profile = "allow_s3_ec2_github_demo"
  backend_port = 8080
  subnets = [
    {
      az     = "us-west-2a",
      prefix = "10.1.1.0/24"
    },
    {
      az     = "us-west-2b",
      prefix = "10.1.2.0/24"
    },
    {
      az     = "us-west-2c",
      prefix = "10.1.3.0/24"
    }
  ]
}