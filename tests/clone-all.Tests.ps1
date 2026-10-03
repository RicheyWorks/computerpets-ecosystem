# Dependency-free regression checks. Git is mocked; no repositories or network
# connections are used. Every target is below the scenario's temporary folder.
$ErrorActionPreference = 'Stop'
$cloneScript = Join-Path (Split-Path $PSScriptRoot -Parent) 'clone-all.ps1'
$powerShell = (Get-Process -Id $PID).Path
$scenarioRoot = Join-Path ([IO.Path]::GetTempPath()) ('ecosystem-clone-tests-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $scenarioRoot | Out-Null
$nl = [Environment]::NewLine
$cases = @(
    @{ Name = 'clone-success'; Existing = 'none'; GitExit = 0; ExpectedExit = 0; Expected = '1 / 1 ok; 0 skipped'; Command = 'clone --depth 1' }
    @{ Name = 'clone-failure'; Existing = 'none'; GitExit = 128; ExpectedExit = 1; Expected = 'Failed: sample'; Command = 'clone --depth 1' }
    @{ Name = 'pull-failure'; Existing = 'git'; GitExit = 1; ExpectedExit = 1; Expected = '0 / 1 ok; 0 skipped'; Command = 'pull --ff-only' }
    @{ Name = 'non-git-preserved'; Existing = 'folder'; GitExit = 0; ExpectedExit = 0; Expected = '0 / 1 ok; 1 skipped'; Command = '' }
    @{ Name = 'case-insensitive-reuse'; Existing = 'Git'; GitExit = 0; ExpectedExit = 0; Expected = '1 / 1 ok; 0 skipped'; Command = 'pull --ff-only' }
)
foreach ($case in $cases) {
    $caseRoot = Join-Path $scenarioRoot $case.Name
    $target = Join-Path $caseRoot 'targets'
    New-Item -ItemType Directory -Path $caseRoot, $target -Force | Out-Null
    Copy-Item -LiteralPath $cloneScript -Destination (Join-Path $caseRoot 'clone-all.ps1')
    Set-Content -LiteralPath (Join-Path $caseRoot 'repos.txt') -Value 'sample'
    if ($case.Existing -ne 'none') {
        $folder = Join-Path $target $(if ($case.Existing -ceq 'Git') { 'SAMPLE' } else { 'sample' })
        New-Item -ItemType Directory -Path $folder | Out-Null
        Set-Content -LiteralPath (Join-Path $folder 'keep.txt') -Value 'preserve me'
        if ($case.Existing -ieq 'git') { New-Item -ItemType Directory -Path (Join-Path $folder '.git') | Out-Null }
    }
    $mock = 'function git { Write-Host ("MOCK-GIT " + ($args -join " ")); $global:LASTEXITCODE = ' + $case.GitExit + ' }'
    $runner = $mock + $nl + '& (Join-Path $PSScriptRoot "clone-all.ps1") -TargetRoot (Join-Path $PSScriptRoot "targets")' + $nl + 'exit $LASTEXITCODE'
    $runnerPath = Join-Path $caseRoot 'scenario.ps1'
    Set-Content -LiteralPath $runnerPath -Value $runner
    $output = & $powerShell -NoProfile -File $runnerPath 2>&1 | Out-String
    $code = $LASTEXITCODE
    if ($code -ne $case.ExpectedExit) { throw "$($case.Name): expected exit $($case.ExpectedExit), got $code. $output" }
    if (!$output.Contains($case.Expected)) { throw "$($case.Name): missing summary '$($case.Expected)'. $output" }
    if ($case.Command -and !$output.Contains($case.Command)) { throw "$($case.Name): missing expected Git command. $output" }
    if (!$case.Command -and $output.Contains('MOCK-GIT')) { throw "$($case.Name): Git was called for a non-Git folder. $output" }
    if ($case.Existing -ne 'none' -and (Get-Content -LiteralPath (Join-Path $folder 'keep.txt') -Raw).Trim() -ne 'preserve me') {
        throw "$($case.Name): existing work was changed"
    }
    Write-Output "PASS $($case.Name)"
}
Write-Output '5 regression checks passed; no network calls or existing checkout changes.'
