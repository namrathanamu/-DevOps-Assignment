#!/bin/bash

# Exit on any error
set -e

echo "📁 Step 1: Cloning the repository..."
git clone https://github.com/namrathanamu/devops-assignment.git
cd devops-assignment

echo "🔨 Step 2: Building the Docker image..."
docker build -t lonelybag-app .

echo "🚀 Step 3: Running the Docker container on port 8080..."
docker run -p 8080:3000 lonelybag-app

echo "🌐 Step 4: App is running!"
echo "Open your browser and go to: http://localhost:8080"

