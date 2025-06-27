# DevOps-Assignment

# Overview:
This project is a simple Dockerized Node.js web app deployed on an AWS EC2 instance with Basic Automation.

# Tech Stack:
- Node.js
- Docker
- AWS EC2 (Ubuntu)
- Git & GitHub

A step-by-step guide to running a Dockerized Node.js web app locally and deploying it on AWS EC2.

# PART 1: Run the App Locally Using Docker

Step 1: Clone the Repository
Open your terminal and run:

    git clone https://github.com/namrathanamu/devops-assignment.git
    cd devops-assignment

Once you're inside the project folder, go to the next step.

Step 2: Build the Docker Image

    docker build -t lonelybag-app .

This command will create a Docker image named lonelybag-app using the Dockerfile in your project.


Step 3: Run the Docker Container

    docker run -p 8080:3000 lonelybag-app

This command will start a container and expose the app on localhost:8080.


Step 4: Open the App in Browser

Open your browser and go to:
    
    http://localhost:8080

You should see the running web application. 

Now that it works locally, let's deploy it on the cloud.

# PART 2: Deploy the App to AWS EC2

Step 1: Launch an EC2 Instance

        -Go to the AWS EC2 Console

        -Click Launch Instance

        Choose:

        -AMI: Ubuntu 22.04 LTS

        -Instance type: t2.micro

        -Key pair: Create one key (.pem file)

        -enable Security group rules: Port 22 (SSH) - for remote login, Port 80 (HTTP) - to access your app

Once your instance is running, go to the next step.

Step 2: SSH into Your EC2 Instance

Use your terminal to SSH into the instance:

    ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>

Replace <EC2_PUBLIC_IP> with the actual public IP of your EC2 instance.





Step 3: Install Docker on EC2

Run these commands one-by-one to install and configure Docker:
    sudo apt update -y

    sudo apt install docker.io -y
    
    sudo systemctl start docker
    
    sudo usermod -aG docker $USER

    newgrp docker

Step 4: Clone the Project and Build Docker Image


    git clone https://github.com/namrathanamu/devops-assignment.git
    
    cd  devops-assignment
    
    docker build -t lonelybag-app .

This builds your app image on the EC2 machine.


Step 5: Run the App Container

    docker run -d -p 80:3000 lonelybag-app

This command runs the app in the background (-d) and maps port 3000 (inside the container) to port 80 (on EC2).



Step 6: Open the App in Browser

Visit:

http://<EC2_PUBLIC_IP>

You should now see your live web app running on the cloud.

# PART 3: USING IAM roles to access S3 from EC2 

I. Create IAM Role 
 
 1. Go to IAM → Roles  
 
  2. Click Create Role  
  
  3. Choose:  
  
     * Trusted entity type: AWS service  

     * Use case: EC2  
  
  5. Click Next  
  
  6. Attach Policy: AmazonS3ReadOnlyAccess  
  
  7. Click Next, then Create Role  
  
  8. Name it: EC2-S3-AccessRole


II. Create an S3 Bucket (for testing)

  1. Go to AWS S3 Console  
  
  2. Click “Create bucket”
  
  3. Keep all defaults (Block public access ON, Versioning OFF)  
  
  4. Click Create bucket

III. Attach the IAM Role to Your EC2
  

  1. Go to EC2 Dashboard

  2. Select instance

  3. Click Actions → Security → Modify IAM Role

  4. Choose EC2S3AccessRole (or your role name)

  5. Save

IV. Test from EC2
		
  RUN THE COMMAND IN EC2 COMMAND LINE 
  
		aws s3 ls
  
  THIS WILL LIST  THE S3 BUCKET 
  

This verifies that:

* The IAM role was properly attached

* The EC2 instance can access S3 without needing AWS credentials


