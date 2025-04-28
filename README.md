1. VPC - Done
2. Subnets (3 Public with public IP) & (3 Private with private cidr) - Done
3. Internet Gateway - Done
4. NateGateway - Done
5. Route Table - done 
6. NACL - Done
7. 2 EC2 Instances, 1 instance type is  t2.micro on public subnet and 1 instance type t3.micro on private subnet with image ami-0e449927258d45bc4 - Done
8. 1 LoadBalancer - Done
9. Security Group (with 2 rules - 1. SSH port 22 , 2. HTTP port 80) - Done 
10. 3 ECR (1. Frontend , 2. Backend, 3. Packages) - Done
11. I am roles and policies (access grant of S3 to EC2 Instance) and also create s3 bucket linked to the instances - Done

Note: Do not use static/hardcore code, code should be variablize and it should work on 2 different environments 
1. Dev environment = t2.micro instance type
2. QA environment = t3.micro instance type 


Everything should be interconnected
