# EFS
## splunk container on ecs with efs volume mount, secret manager for container env (SPLUNK_PASSWORD), Netwotk Loadbalancer TLS, certificate manger, NLB logs on s3.

## Ref 
### ECS
```
https://aws.amazon.com/premiumsupport/knowledge-center/ecs-fargate-mount-efs-containers-tasks/
https://aws.amazon.com/blogs/aws/amazon-ecs-supports-efs/
```
### Secret Manager
```
https://aws.amazon.com/premiumsupport/knowledge-center/ecs-data-security-container-task/
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data-secrets.html
```
### NLB access Logs to s3
```
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data-secrets.html
```
## Steps

### 1. Create hosted zone in Route 53
### 2. Creta SSL certificate in ACM

### 3. Create NLB
#### a. Select the VPC where ecs is created
#### b. Listener- select TLS protocol (443)
#### c. Select certificate from ACM

### 4. Create Target Group
#### a. Protocol TCP (8000)
#### b. Select VPC

### 5. Create Secret in secret manager
#### SPLUNK_PASSWORD

### 6. Create SG for EFS
##### inbound rule - NFS 2049 with trget sg where container/ec2

### 7. Create EFS
#### a. select the correct vpc
#### b. select the sg create above for mount point in each subnet

### 8. Create Access Point
#### a. seelct the fs created above
#### b. create root folder
#### c. POSIX user, Root Directory (41812)

### 9. Create secret manager
```
aws secretsmanager create-secret --name SPLUNK_PASSWORD --secret-string Splunk-123
```

### 10. Create IAM role for ecs task
#### a. role- ecs-task
#### b. trust advisor- ECS and Elastic Container Service Task
#### c. Policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:ClientMount",
                "elasticfilesystem:ClientWrite"
            ],
            "Resource": "arn:aws:elasticfilesystem:REGION:ACCOUNT_ID:file-system/fs-xxxxxx",
            "Condition": {
                "StringEquals": {
                    "elasticfilesystem:AccessPointArn": "arn:aws:elasticfilesystem:REGION:ACCOUNT_ID:access-point/fsap-xxxxxxxxxxxxx"
                }
            }
        }
    ]
}
```
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ssm:GetParameters",
        "secretsmanager:GetSecretValue"
      ],
      "Resource": [
        "arn:aws:ssm:us-east-1:awsExampleAccountID:parameter/awsExampleParameter",
        "arn:aws:secretsmanager:us-east-1:awsExampleAccountID:secret:awsExampleParameter*"
      ]
    }
  ]
}
```
### 11. create ecs task definition
#### a. add efs and accesspoint in volume
#### b. add container
#### c. 

### 12. Create Service
### 13. Create s3 for get NLB log
#### a. bucket policy
************************************