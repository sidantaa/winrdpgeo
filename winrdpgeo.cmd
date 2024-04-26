
# Define the URL of the source providing IP address ranges for Nepal
$NepalIPRangesURL = "https://example.com/nepal-ip-ranges.txt"

# Display message indicating that the script is adding IP addresses to the Windows Firewall list
Write-Host @"
╭━━━╮ ╭━━━━━━━━━━━━━━━╮
┃╭━╮┃ ┃ Adding IP addresses ┃
┃┃╱┃┃ ┃     to Windows      ┃
┃┃╱┃┃ ┃    Firewall List... ┃
┃┃╱┃┃ ┃                    ┃
┃╰━╯┃ ┃  🇳🇵   🇳🇵   🇳🇵  ┃
╰━━━╯ ╰━━━━━━━━━━━━━━━╯
"@ 
Start-Sleep -Seconds 2

# Fetch the IP address ranges for Nepal
$NepalIPRanges = Invoke-RestMethod -Uri $NepalIPRangesURL

# Clear existing firewall rules for RDP (optional)
# Remove-NetFirewallRule -DisplayName "Allow RDP"

# Display message indicating that the script is updating the list
Write-Host @"
╭━━━━━━━━━━━━━━━━━━━━━━━━╮
┃  Updating list...  ┃
┃                    ┃
┃      🛠️   🧰   🛠️      ┃
╰━━━━━━━━━━━━━━━━━━━━━━━━╯
"@ 
Start-Sleep -Seconds 2

# Add firewall rules to allow RDP only from Nepal IP ranges
foreach ($range in $NepalIPRanges) {
    New-NetFirewallRule -DisplayName "Allow RDP from Nepal" -Direction Inbound -LocalPort 3389 -Protocol TCP -RemoteAddress $range
}

# Display final message indicating that the Nepal IP list has been updated on the Windows Firewall
Write-Host @"
╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
┃  Nepal IP List updated on Windows Firewall!!!  ┃
┃                                      ┃
┃    🎉   🎉   🎉   🇳🇵   🎉   🎉   🎉    ┃
╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
"@ 
Write-Host "Access outside of Nepal is strictly prohibited."
Write-Host @"
╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
┃          ✨ Scripted By: Sudip ✨          ┃
╰━━━━━━━━━━━━━━━━━━━━
