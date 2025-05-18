INTEGERS ARRAY PROBLEM
* Implemented with python
* Logic implemented (NOTE FOR ME)
     EXAMPLE WITH  [1 2 3 4]

  - left to right
    - At index 0 theres nothing on the left, so is 1.
    - At index 1 number to the left is 1, left product is 1.
    - At index 2 numbers to the left are 1 and 2, left product is 1x2=2.
    - At index 3 numbers to the left are 1 2 3, left product is 1x2x3=6
    - array_left_to_right [1 1 2 6]

  - right to left
    - At index 3 theres nothing to the right,  1.
    - At index 2 numbers to the right is 4,  4.
    - At index 1 numbers to the right are 3  4, 3x4=12.
    - At index 0 numbers to the right are 2 3 4, 2x3x4=24.
    - array_right_to_left [24 12 4 1]
    - final_result= array_left_to_right x array_right_to_left = 24 12 8 6

  DEPLOYMENT PROBLEM
  * The CI CD was implemented using AWS CodeBuild to deploy an EC2 within AWS
  * AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are environment variables defined in AWS CodeBuild. If implemented using another CI CD tool keep this in mind
  * Within envs/prod the backend.tf file points to ensitech-challenge S3 storage that keeps the terraform.tfstate file for this project. Keep this in mind and change backend config accordingly
  * The main file used by pipeline is cicd/buildspec.yml
  * buildspec.yml file calls the following files
      * configure-named-profile.sh : sets the profile configuration ( AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_REGION ) to deploy within the AWS test environment I've used.
      * install-terraform.sh :  installs yum and terraform, outputs the tf version (this could be improved by installing a fixed version of tf)
      * apply-terraform.sh : gets into the envs/prod directory where the main TF file is, runs terraform init to install providers, runs terraform apply with auto-approve flag
  * terraform.tfvars have the basic variable values
  * main.tf -> locals{ } block uses the terraform.tfvars values to define the name of the resources that will be deployed (this could be improved creating a locals.tf file)
  * the TF code was created using modules: each module has its main file and variables.tf file
  * modules: ec2instance, securitygroup, subnet, vpc (this one contains the definitions of VPC, Internet Gateway, Route Table)
