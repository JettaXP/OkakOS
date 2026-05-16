Set-Location C:\Users\paulg\OkakOS
git add .
git commit -m "Add Pocoyo Optimizator and SDDM 67WM troll"
$token = Get-Content C:\Users\paulg\token.txt -Raw
$token = $token.Trim()
$remote = "https://jettaxp:" + $token + "@github.com/JettaXP/OkakOS.git"
git remote set-url origin $remote
git push -u origin main
Remove-Item C:\Users\paulg\OkakOS\push.ps1