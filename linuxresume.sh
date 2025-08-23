#!/bin/bash

#------------------------- Welcome to my script: Auto deploy localhost website to display your resume---------------------------------------
#################################################################
# Function: print_color
# Description: Print a message in a specified color.
# Usage: print_color "green" "Your message here"
#################################################################
function print_color(){
  NC='\033[0m'  # No Color
  case $1 in
    "green") COLOR='\033[0;32m' ;;
    "red")   COLOR='\033[0;31m' ;;
    *)       COLOR='\033[0m' ;;
  esac
  echo -e "${COLOR}$2${NC}"
}


#################################################################
# Function: check_service_status
# Description: Check if a service is active.
# Usage: check_service_status apache2
#################################################################
function check_service_status(){
  service_name=$1
  is_active=$(systemctl is-active "$service_name")
  if [ "$is_active" = "active" ]; then
    print_color "green" "$service_name Service is active"
  else
    print_color "red" "$service_name Service is not active"
    exit 1
  fi
}
#################################################################
# Function: check_cv
# Description: Check if a CV file  exists.
# Usage: check_cv pepito.garcia.html
#################################################################
function check_cv(){
    cv_name=$1
    if test -f "$cv_name"; then
  print_color "green" "$cv_name Exists."
  else
  print_color "red" "$cv_name does not Exist"
  exit 1
fi
}
#########################################
# Apache installation and Configuration
#########################################

print_color "green" "Installing Apache"
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
check_service_status apache2
#################################
# CV Deployment onto index.html
#################################

print_color "green" "Apache web is ready to deploy resume using HTML format"
while true
do
    echo "1. Specify resume file name (e.g. /home/documents/mycv.html)"
    echo "2. Exit Menu"

    read -r -p "Enter your choice: " choice
case $choice in
    1) echo "Escribe la ruta de tu CV:"
        read -r CV_PATH                 
        check_cv "$CV_PATH"            
        cp "$CV_PATH" /var/www/html/index.html
        print_color "green" "CV desplegado correctamente"
        ;;
    2) break ;;
    *) print_color "red" "choose a valid option"
     continue ;;
esac
done