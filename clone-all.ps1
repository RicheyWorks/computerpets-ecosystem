# Clone / update the ComputerPets flagship and all companion organs.
# Target: C:\Users\730ri\projects
$ErrorActionPreference = "Stop"
$Root = "C:\Users\730ri\projects"
$Owner = "RicheyWorks"

$Repos = @(
    "computerpets",
    "computerpets-ecosystem",
    "computerpets-cortex",
    "computerpets-gaze",
    "computerpets-vox",
    "computerpets-motion",
    "computerpets-atelier",
    "computerpets-companion",
    "computerpets-bazaar",
    "computerpets-studio",
    "computerpets-console",
    "computerpets-kennel",
    "computerpets-minter",
    "computerpets-steamgate",
    "computerpets-visitation",
    "computerpets-telemetry",
    "computerpets-quests",
    "computerpets-ledger",
    "computerpets-twitch",
    "computerpets-discord",
    "computerpets-wallpaper",
    "computerpets-nest",
    "computerpets-overlay",
    "computerpets-sdk",
    "computerpets-lore",
    "computerpets-babel",
    "computerpets-bounty",
    "computerpets-ballot",
    "computerpets-patcher",
    "computerpets-migrator",
    "computerpets-forensics",
    "computerpets-stampede"
)

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
