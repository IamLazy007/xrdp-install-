#!/bin/bash

# Update the package lists
echo "Updating package lists..."
sudo apt update

# Install XRDP
echo "Installing XRDP..."
sudo apt install -y xrdp

# Install XFCE4 (a lightweight desktop environment)
echo "Installing XFCE4 desktop environment..."
sudo apt install -y xfce4 xfce4-goodies

# Install xfce4-terminal
echo "Installing xfce4-terminal..."
sudo apt install -y xfce4-terminal

# Configure XRDP to use XFCE4
echo "Configuring XRDP to use XFCE4..."
echo xfce4-session > ~/.xsession

# Restart the XRDP service
echo "Restarting XRDP service..."
sudo systemctl restart xrdp

# Enable XRDP service to start on boot
echo "Enabling XRDP service to start on boot..."
sudo systemctl enable xrdp

echo "XRDP installation and configuration completed."
echo "You can now connect to your machine using an RDP client."

# Optionally, open the firewall for XRDP (port 3389)
read -p "Do you want to open the firewall for XRDP (port 3389)? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Opening firewall for XRDP..."
    sudo ufw allow 3389/tcp
    echo "Firewall rule added."
fi

echo "All done!"
