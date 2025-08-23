# CV Deploy Script (Mini Project)

This is a **Bash automation script** created as a mini-project to practice and apply concepts learned from [KodeKloud's Linux and Bash Basics courses](https://kodekloud.com/).

The script installs and configures **Apache2** on a Linux system, then allows you to deploy your own HTML CV by replacing Apache's default landing page.

---

## Features
- Installs and starts **Apache2** web server  
- Color-coded output for success/error messages  
- Checks service status with `systemctl`  
- Menu-driven interface with two options:  
  1. Provide path to your HTML CV → deploys it to `/var/www/html/index.html`  
  2. Exit the script  
- Verifies that the CV file exists before deployment  
- Confirms service status after installation  

---

## Usage
1. Clone or download this repo.  
2. Ensure the script is executable: chmod +x linuxresume.sh

## To run:
sudo bash linuxresume.sh

After running, visit http://localhost to verify your CV is being served.


