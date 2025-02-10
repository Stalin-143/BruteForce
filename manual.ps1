# Brute Force Attack Script - PowerShell Helper
# Use this script to guide users through the ethical usage of the brute-force attack script.

Clear-Host

Write-Host "`n===================================" -ForegroundColor Cyan
Write-Host " Brute Force Attack Script - Manual " -ForegroundColor Yellow
Write-Host "===================================`n" -ForegroundColor Cyan

# Function to display a help menu
function Show-Help {
    Write-Host "`n🔹 Available Commands:" -ForegroundColor Green
    Write-Host "  1. Install Dependencies  -> Installs required Python libraries"
    Write-Host "  2. Run Script            -> Starts the brute-force attack script"
    Write-Host "  3. Troubleshooting       -> Provides troubleshooting tips"
    Write-Host "  4. Exit                  -> Close the script"
}

# Function to install dependencies
function Install-Dependencies {
    Write-Host "`n🔄 Installing Python Dependencies..." -ForegroundColor Yellow
    python -m pip install requests beautifulsoup4
    Write-Host "✅ Dependencies installed successfully!" -ForegroundColor Green
}

# Function to run the brute-force script
function Run-BruteForce {
    Write-Host "`n🚀 Running the Brute Force Attack Script..." -ForegroundColor Yellow
    $scriptPath = Read-Host "Enter the path of the Python script (e.g., C:\Users\YourUser\Nexbru.py)"
    
    if (Test-Path $scriptPath) {
        python $scriptPath
    } else {
        Write-Host "❌ Error: Script not found at the specified path." -ForegroundColor Red
    }
}

# Function to display troubleshooting tips
function Troubleshoot {
    Write-Host "`n🔍 Troubleshooting Guide" -ForegroundColor Cyan
    Write-Host "`n1️⃣ No login forms detected?" -ForegroundColor Yellow
    Write-Host "   - Ensure you are using the correct login page URL."
    Write-Host "   - Manually inspect form field names using browser dev tools."

    Write-Host "`n2️⃣ Incorrect field names?" -ForegroundColor Yellow
    Write-Host "   - Modify the script to specify field names explicitly."

    Write-Host "`n3️⃣ Blocked due to rate-limiting?" -ForegroundColor Yellow
    Write-Host "   - Increase delay (modify 'time.sleep(1)' in Python script)."
    Write-Host "   - Use a VPN or proxy rotation."

    Write-Host "`n4️⃣ Ethical Considerations:" -ForegroundColor Red
    Write-Host "   ❌ Unauthorized access is ILLEGAL."
    Write-Host "   ✅ Always obtain explicit permission before testing."
}

# Main Menu
do {
    Show-Help
    $choice = Read-Host "`nEnter your choice (1-4)"

    switch ($choice) {
        "1" { Install-Dependencies }
        "2" { Run-BruteForce }
        "3" { Troubleshoot }
        "4" { Write-Host "`nExiting... Goodbye! 👋" -ForegroundColor Cyan; exit }
        default { Write-Host "`n❌ Invalid choice! Please select a valid option (1-4)." -ForegroundColor Red }
    }
} while ($true)
