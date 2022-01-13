# ECS Cluster
## logical grouping of ec2 instances
## ECS agent
## ECS register the instance into ecs cluster
## special ami made for ecs
*****************************
# Create role for ECS   access:
## allow to communicate with ecs and ecr
```
AmazonEC2ContainerServiceforEC2Role
```
## to manage resources
```
AmazonEC2ContainerServiceRole
```
## ECS task execution role
```
AmazonECSTaskExecutionRolePolicy
```
## autoscaling role
```
AmazonEC2ContainerServiceAutoscaleRole
```
*****************************
# Create 
## VPC
## subnet
## IGW
## security group
*****************************

# Create Task definition

## ECS TASK ROLE - s3
## API call to ec2 instance
****************************

# Create EC2 instance and attach ec2 instance profile to create 
## Service
## Cloudwatch logs
## ECR Service
