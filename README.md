# -DevOps-Assignment
Overview:
This project is a simple Dockerized Node.js web app deployed on an AWS EC2 instance with Basic Automation.

Tech Stack:
- Node.js
- Docker
- AWS EC2 (Ubuntu)
- Git & GitHub

A step-by-step guide to running a Dockerized Node.js web app locally and deploying it on AWS EC2.

PART 1: Run the App Locally Using Docker

Step 1: Clone the Repository
Open your terminal and run:

    git clone https://github.com/<your-username>/lonely-bag-devops-assignment.git
    cd lonely-bag-devops-assignment
Once you're inside the project folder, go to the next step.

Step 2: Build the Docker Image

    docker build -t lonelybag-app .
This command will create a Docker image named lonelybag-app using the Dockerfile in your project.
Once the build completes, go to the next step.

Step 3: Run the Docker Container

    docker run -p 8080:3000 lonelybag-app
This command will start a container and expose the app on localhost:3000.
Once the container is running, go to the next step.

Step 4: Open the App in Browser

Open your browser and go to:
    
    http://localhost:8080

You should see the running web application. 

Now that it works locally, let's deploy it on the cloud.

PART 2: Deploy the App to AWS EC2

Step 1: Launch an EC2 Instance

Go to the AWS EC2 Console

Click Launch Instance

Choose:

-AMI: Ubuntu 22.04 LTS

-Instance type: t2.micro

-Key pair: Create or select one (.pem file)

-Security group rules: Port 22 (SSH) - for remote login, Port 80 (HTTP) - to access your app

Once your instance is running, go to the next step.

Step 2: SSH into Your EC2 Instance

Use your terminal to SSH into the instance:

    ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>

Replace <EC2_PUBLIC_IP> with the actual public IP of your EC2 instance.

Once logged in, go to the next step.



Step 3: Install Docker on EC2

Run these commands one-by-one to install and configure Docker:
    sudo apt update -y

    sudo apt install docker.io -y
    
    sudo systemctl start docker
    
    sudo usermod -aG docker $USER

    newgrp docker

Step 4: Clone the Project and Build Docker Image


    git clone https://github.com/<your-username>/lonely-bag-devops-assignment.git
    
    cd lonely-bag-devops-assignment
    
    docker build -t lonelybag-app .

This builds your app image on the EC2 machine.


Step 5: Run the App Container

    docker run -d -p 80:3000 lonelybag-app

This command runs the app in the background (-d) and maps port 3000 (inside the container) to port 80 (on EC2).



Step 6: Open the App in Browser

Visit:

http://<EC2_PUBLIC_IP>

You should now see your live web app running on the cloud.
