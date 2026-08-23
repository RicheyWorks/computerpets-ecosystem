# Bootstrap the ComputerPets map onto this Windows machine.
# Paste in PowerShell from anywhere:
#   Set-Location C:\Users\730ri\projects
#   git clone https://github.com/RicheyWorks/computerpets-ecosystem.git
#   Set-Location .\computerpets-ecosystem
#   .\clone-all.ps1
#
# Or run this file after the clone. It is safe to re-run.
$ErrorActionPreference = "Stop"
$Root = "C:\Users\730ri\projects"
$Map = Join-Path $Root "computerpets-ecosystem"
$Url = "https://github.com/RicheyWorks/computerpets-ecosystem.git"

New-Item -ItemType Directory -Force -Path $Root | Out-Null

if (Test-Path (Join-Path $Map ".git")) {
    Write-Host "pull  computerpets-ecosystem" -ForegroundColor Yellow
    git -C $Map pull --ff-only
} elseif (Test-Path $Map) {
    throw "$Map exists but is not a git repo. Move it aside and re-run."
} else {
    Write-Host "clone computerpets-ecosystem" -ForegroundColor Green
    git clone $Url $Map
}

$cloneAll = Join-Path $Map "clone-all.ps1"
& $cloneAll
