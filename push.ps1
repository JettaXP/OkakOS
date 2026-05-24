Set-Location C:\Users\Philip\okakos
git add .
git commit -m "OkakOS 67: KDE Plasma, Calamares config, full branding, post-install scripts"
if (Test-Path 'C:\Users\Philip\token.txt') {
  $token = Get-Content 'C:\Users\Philip\token.txt' -Raw
  $token = $token.Trim()
  $remote = "https://jettaxp:$token@github.com/JettaXP/OkakOS.git"
  git remote set-url origin $remote
} elseif (Get-Command gh -ErrorAction SilentlyContinue) {
  Write-Host 'Using gh CLI for authentication (no token file used)'
} else {
  Write-Host 'No token found; pushing will attempt existing git credentials'
}

git push -u origin main