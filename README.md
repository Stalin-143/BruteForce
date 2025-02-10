

# Brute Force Attack Script - Ethical Usage Guide

## 📌 Introduction

This script is designed for ethical hacking and penetration testing to identify weak credentials in login forms. It automates login attempts using a list of usernames and passwords to help security professionals assess vulnerabilities.

⚠ Unauthorized use is illegal and punishable by law. Always obtain explicit permission before testing any system.
🚀 Features

✅ Detects HTML-based login forms automatically.
✅ Supports API-based login brute force.
✅ Handles multi-step authentication.
✅ Mimics a real browser with custom headers.
✅ Adds delays to prevent rate-limiting or IP bans.
✅ Uses wordlists for usernames & passwords.
🔧 Requirements

## Ensure your system has:

    Python 3.x installed
    Required libraries:

    pip install requests beautifulsoup4
    
Wordlists containing potential usernames and passwords.

## 📂 Installation & Usage

##### 1️⃣ Clone the Repository

    git clone https://github.com/Stalin-143/BruteForce
    cd YourRepo

### 2️⃣ Run the Script

      python3 Nexbru.py

### 3️⃣ Input Required Details

    Target URL (e.g., https://example.com/login)
    Username list file path (e.g., /path/to/usernames.txt)
    Password list file path (e.g., /path/to/passwords.txt)

### 4️⃣ Script Execution Example

      Enter the target URL: https://example.com/login
      Enter the username list file path: /home/user/usernames.txt
      Enter the password list file path: /home/user/passwords.txt
      [+] Found 1 login form.
      [+] Testing form at https://example.com/login
      [-] Tried: admin | password123
      [-] Tried: admin | admin123
      [✅] Credentials Found: admin | securePass!

### 🛠 Troubleshooting

🔹 No login forms detected?
✔ Ensure the URL points to the correct login page.
✔ Check for non-standard field names (e.g., user_id instead of username).

🔹 Incorrect field names?
✔ Modify the script to manually specify field names.

🔹 Blocked due to rate limiting?
✔ Increase sleep time (time.sleep(1)).
✔ Use a VPN or proxy for IP rotation.
## 🔒 Ethical Considerations

✔ Obtain explicit permission before testing any system.
✔ Promote strong password policies to prevent brute force attacks.
✔ Use for legal security testing only.
✔ Report vulnerabilities responsibly.


## 📜 License

This project is intended for educational and ethical use only. Unauthorized usage is strictly prohibited.

📌 By using this script, you agree to abide by ethical hacking guidelines.

 ## 💰 You can help me by Donating
 [![BuyMeACoffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-ffdd00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/stalin143) [![PayPal](https://img.shields.io/badge/PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/stalinS143) 
