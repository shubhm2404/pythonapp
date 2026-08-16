#/bin/bash/

set -e

echo "========================================="
echo "     Jenkins Installation Script"
echo "========================================="


echo "step [1/6] -- Updating System Packages.....!"
sudo apt-get update -y

echo "step [2/6] -- Installing Required Packages .....!"
sudo apt-get install -y fontconfig openjdk-21-jre 

echo "step [3/6] Checking Java version..."
java --version

echo "step [4/6] Adding Jenkins repository key and LTS..."

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "[5/6] Adding Jenkins LTS repository..."
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "step [5/6] Updating Packages and installing jenkins"
sudo apt update
sudo apt install jenkins -y

echo "========================================="
echo "     Jenkins Installation Complete"
echo "========================================="

echo "Starting Jenkins..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "========================================="
echo "     Jenkins Installation Status"
echo "========================================="

sudo systemctl status jenkins
