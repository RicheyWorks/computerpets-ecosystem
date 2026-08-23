# Clone / update the ComputerPets flagship, organs, and games.
# Target: C:\Users\730ri\projects
$ErrorActionPreference = "Stop"
$Root = "C:\Users\730ri\projects"
$Owner = "RicheyWorks"

$Repos = Get-Content -Path (Join-Path $PSScriptRoot "repos.txt") | Where-Object { $_.Trim() -ne "" }

New-Item -ItemType Directory -Force -Path $Root | Out-Null
Write-Host "Installing ComputerPets ecosystem into $Root" -ForegroundColor Cyan

$ok = 0
$fail = @()

foreach ($name in $Repos) {
    $dest = Join-Path $Root $name
    $url = "https://github.com/$Owner/$name.git"
    try {
        if (Test-Path (Join-Path $dest ".git")) {
            Write-Host "pull  $name" -ForegroundColor Yellow
            git -C $dest pull --ff-only
        } elseif (Test-Path $dest) {
            Write-Host "skip  $name (folder exists, not a git repo)" -ForegroundColor DarkYellow
        } else {
            Write-Host "clone $name" -ForegroundColor Green
            git clone --depth 1 $url $dest
        }
        $ok++
    } catch {
        Write-Host "FAIL  $name : $_" -ForegroundColor Red
        $fail += $name
    }
}

Write-Host ""
Write-Host "Done. $ok / $($Repos.Count) ok. Root: $Root" -ForegroundColor Cyan
if ($fail.Count -gt 0) {
    Write-Host ("Failed: " + ($fail -join ", ")) -ForegroundColor Red
    exit 1
}
