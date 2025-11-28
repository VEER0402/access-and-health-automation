#!/bin/bash

while true
do
    echo "========== DevOps Automation =========="
    echo "1. Generate GitHub Access Report"
    echo "2. Check AWS Instance Health"
    echo "3. Exit"
    read -p "Choose an option: " choice

    case $choice in
        1)
            read -p "Enter repo owner: " owner
            read -p "Enter repo name: " repo
            ./github_access_report.sh "$owner" "$repo"
            ;;
        2)
            ./aws_instance_health.sh
            ;;
        3)
            echo "Exiting..."; exit 0 ;;
        *)
            echo "Invalid option" ;;
    esac

    echo ""  
done

