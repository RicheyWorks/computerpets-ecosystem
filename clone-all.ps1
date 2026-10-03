# Clone / update the ComputerPets flagship, organs, and games.
# Target defaults to the current Windows user's projects folder.
# Windows is case-insensitive: ComputerPets counts as computerpets.
param([string]$TargetRoot = (Join-Path $env:USERPROFILE "projects"))

$ErrorActionPreference = "Stop"
$Root = $TargetRoot
$Owner = "RicheyWorks"

$ReposFile = Join-Path $PSScriptRoot "repos.txt"
if (-not (Test-Path -LiteralPath $ReposFile)) {
    throw "repos.txt missing next to clone-all.ps1"
}

$Repos = Get-Content -Path $ReposFile | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }

New-Item -ItemType Directory -Force -Path $Root | Out-Null
Write-Host "Installing ComputerPets ecosystem into $Root ($($Repos.Count) repos)" -ForegroundColor Cyan

function Get-ExistingDir {
    param([string]$Root, [string]$Name)
    Get-ChildItem -LiteralPath $Root -Directory -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -ieq $Name } |
        Select-Object -First 1
}

$ok = 0
$skipped = 0
$fail = @()

foreach ($name in $Repos) {
    $existing = Get-ExistingDir -Root $Root -Name $name
    $url = "https://github.com/$Owner/$name.git"
    try {
        if ($null -ne $existing -and (Test-Path (Join-Path $existing.FullName ".git"))) {
            Write-Host "pull  $($existing.Name)" -ForegroundColor Yellow
            git -C $existing.FullName pull --ff-only
            if ($LASTEXITCODE -ne 0) {
                throw "git pull failed with exit code $LASTEXITCODE"
            }
            $ok++
        } elseif ($null -ne $existing) {
            Write-Host "skip  $($existing.Name) (folder exists, not a git repo)" -ForegroundColor DarkYellow
            $skipped++
        } else {
            $dest = Join-Path $Root $name
            Write-Host "clone $name" -ForegroundColor Green
            git clone --depth 1 $url $dest
            if ($LASTEXITCODE -ne 0) {
                throw "git clone failed with exit code $LASTEXITCODE"
            }
            $ok++
        }
    } catch {
        Write-Host "FAIL  $name : $_" -ForegroundColor Red
        $fail += $name
    }
}

Write-Host ""
Write-Host "Done. $ok / $($Repos.Count) ok; $skipped skipped. Root: $Root" -ForegroundColor Cyan
if ($fail.Count -gt 0) {
    Write-Host ("Failed: " + ($fail -join ", ")) -ForegroundColor Red
    exit 1
}
