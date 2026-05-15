Set-Location C:\Users\paulg\OkakOS
git init
git branch -M main
git config user.email "jettaxp@users.noreply.github.com"
git config user.name "JettaXP"
git add .
git commit -m "Initial commit: OkakOS setup with GitHub Actions"
$token = Get-Content C:\Users\paulg\token.txt -Raw
$token = $token.Trim()
$remote = "https://jettaxp:" + $token + "@github.com/JettaXP/OkakOS.git"
git remote add origin $remote
git push -u origin main
Remove-Item C:\Users\paulg\OkakOS\push.ps1
