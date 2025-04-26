#!/bin/bash

# Update and Install Base Packages
echo "Updating and upgrading packages..."
apt update
apt upgrade -y
apt install -y python3 python3-venv python3-pip curl wget screen git lsof

# Install Node.js
echo "Setting up Node.js..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt update
apt install -y nodejs

# Clone the repository
echo "Cloning rl-swarm repository..."
git clone https://github.com/gensyn-ai/rl-swarm.git
cd rl-swarm

# Setup Python Virtual Environment
echo "Creating Python virtual environment..."
python3 -m venv .venv
. .venv/bin/activate

# Install Frontend Dependencies
cd modal-login
echo "Installing Node.js dependencies..."
curl -L https://www.npmjs.com/install.sh | sh
npm install --global yarn --force
yarn install
yarn upgrade
yarn add next@latest
yarn add viem@latest
cd ..

# Create necessary directories and files
echo "Setting up environment..."
mkdir -p /home/jovyan
touch /home/jovyan/.bashrc

