# Bootstrap the ComputerPets map onto this Windows machine.
# Paste in PowerShell from anywhere:
#   $projectRoot = Join-Path $env:USERPROFILE 'projects'
#   New-Item -ItemType Directory -Path $projectRoot -Force | Out-Null
#   Set-Location $projectRoot
#   git clone https://github.com/RicheyWorks/computerpets-ecosystem.git
#   Set-Location .\computerpets-ecosystem
#   .\clone-all.ps1 -TargetRoot $projectRoot
#
# Or run this file after the clone. Existing repositories use fast-forward pulls.
param([string]$TargetRoot = (Join-Path $env:USERPROFILE "projects"))

$ErrorActionPreference = "Stop"
$Root = $TargetRoot
$Map = Join-Path $Root "computerpets-ecosystem"
$Url = "https://github.com/RicheyWorks/computerpets-ecosystem.git"

New-Item -ItemType Directory -Force -Path $Root | Out-Null

if (Test-Path (Join-Path $Map ".git")) {
    Write-Host "pull  computerpets-ecosystem" -ForegroundColor Yellow
    git -C $Map pull --ff-only
    if ($LASTEXITCODE -ne 0) {
        throw "git pull failed with exit code $LASTEXITCODE"
    }
} elseif (Test-Path $Map) {
    throw "$Map exists but is not a git repo. Move it aside and re-run."
} else {
    Write-Host "clone computerpets-ecosystem" -ForegroundColor Green
    git clone $Url $Map
    if ($LASTEXITCODE -ne 0) {
        throw "git clone failed with exit code $LASTEXITCODE"
    }
}

$cloneAll = Join-Path $Map "clone-all.ps1"
& $cloneAll -TargetRoot $Root
if ($LASTEXITCODE -ne 0) {
    throw "Repository clone pass failed with exit code $LASTEXITCODE"
}
