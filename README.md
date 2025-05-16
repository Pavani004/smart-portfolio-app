# Smart Portfolio App – Full Stack DevOps & AWS (Self peer project)

A Dockerized MERN stack app with CI/CD pipeline via GitHub Actions. Includes an AWS AI-powered ETL pipeline and deployed using AWS Free Tier (EC2, S3). Monitored with AWS CloudWatch.

## Features
- React + Node.js + MongoDB app
- Dockerized frontend and backend
- GitHub Actions for CI/CD
- Deployed on AWS EC2 (Free Tier)
- S3 used for static asset storage
- Infrastructure as Code via Terraform
- AWS CloudWatch for log monitoring

## Deployment Instructions
1. Provision EC2 instance (Ubuntu) and S3 via Terraform.
2. SSH into EC2 and clone this repo.
3. Run `docker-compose up -d` to start the app.
4. Verify services running at `<your-ec2-ip>:3000`.

## ETL Component (AI-Powered)
An optional ETL microservice uses AWS Lambda and Python to process and analyze uploaded datasets.

## License
MIT
