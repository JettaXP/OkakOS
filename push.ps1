Set-Location C:\Users\Philip\okakos
git add .
git commit -m "OkakOS 67: KDE Plasma, Calamares config, full branding, post-install scripts"
$token = Get-Content C:\Users\Philip\token.txt -Raw
$token = $token.Trim()
$remote = "https://jettaxp:" + $token + "@github.com/JettaXP/OkakOS.git"
git remote set-url origin $remote
git push -u origin main