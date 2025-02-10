#!/bin/bash

# Function to display text with animation
animate_text() {
    text="$1"
    delay=0.05  # Adjust speed of animation
    for ((i = 0; i < ${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

clear

animate_text "======================================="
animate_text "       BRUTE FORCE ATTACK MANUAL       "
animate_text "======================================="

sleep 1

animate_text "-> This script is for ethical hacking and penetration testing only!"
animate_text "-> Unauthorized use is illegal!"
animate_text "-> Ensure you have proper authorization before proceeding."
sleep 1

echo ""
animate_text "[*] Features:"
animate_text "  - Auto-detects login forms"
animate_text "  - Supports API-based brute force"
animate_text "  - Multi-step authentication testing"
animate_text "  - Uses username & password lists"
sleep 1

echo ""
animate_text "[*] Requirements:"
animate_text "  - Python 3.x installed"
animate_text "  - Required libraries: requests, beautifulsoup4"
animate_text "  - Wordlists containing usernames & passwords"
sleep 1

echo ""
animate_text "[*] Setup & Execution:"
animate_text "  1. Clone the repository: git clone https://github.com/Stalin-143/YourRepo.git"
animate_text "  2. Navigate to the directory: cd YourRepo"
animate_text "  3. Run the script: python3 Nexbru.py"
sleep 1

echo ""
animate_text "[*] Example Usage:"
animate_text "  Enter the target URL: https://example.com/login"
animate_text "  Enter the username list file path: /home/user/usernames.txt"
animate_text "  Enter the password list file path: /home/user/passwords.txt"
animate_text "  [✅] Credentials Found: admin | securePass!"
sleep 1

echo ""
animate_text "[*] Troubleshooting:"
animate_text "  - No login forms detected? Ensure the correct URL is used."
animate_text "  - Incorrect field names? Modify script settings manually."
animate_text "  - Rate limiting? Increase sleep time or use a proxy."
sleep 1

echo ""
animate_text "======================================="
animate_text "    USE RESPONSIBLY & ETHICALLY!      "
animate_text "======================================="
