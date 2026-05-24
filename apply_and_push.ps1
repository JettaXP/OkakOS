Set-Location C:\Users\Philip\okakos

if (-not (Test-Path .git)) {
  git init
}

git add --all

try {
  git commit -m "CI: fix build placeholder and secure push.ps1`n`nCo-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>" -q
} catch {
  Write-Host "No changes to commit"
}

$token = ""
if (Test-Path "C:\Users\Philip\token.txt") {
  $token = (Get-Content "C:\Users\Philip\token.txt" -Raw).Trim()
}

if ($token -ne "") {
  git remote remove origin 2>$null | Out-Null
  git remote add origin "https://jettaxp:$token@github.com/jettaxp/okakos.git"
  git branch -M main
  git push -u origin main
  git remote set-url origin "https://github.com/jettaxp/okakos.git"
} else {
  if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Host "gh available but no token; skipping push"
  } else {
    Write-Host "No token and no gh; skipping push"
  }
}
