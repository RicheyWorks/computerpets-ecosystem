# Isolated bootstrap checks. Git and the final clone pass are mocked; no network.
$ErrorActionPreference = 'Stop'
$bootstrap = Join-Path (Split-Path $PSScriptRoot -Parent) 'bootstrap.ps1'
$powerShell = (Get-Process -Id $PID).Path
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar)
$scenarioRoot = [IO.Path]::GetFullPath((Join-Path $tempRoot ('ecosystem-bootstrap-tests-' + [guid]::NewGuid())))
if (!$scenarioRoot.StartsWith($tempRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Temporary fixture must remain below the system temporary directory.'
}
New-Item -ItemType Directory -Path $scenarioRoot | Out-Null
try {
    foreach ($childExit in @(0, 23)) {
        $caseRoot = Join-Path $scenarioRoot "child-exit-$childExit"
        $map = Join-Path $caseRoot 'targets\computerpets-ecosystem'
        New-Item -ItemType Directory -Path (Join-Path $map '.git') -Force | Out-Null
        Copy-Item -LiteralPath $bootstrap -Destination (Join-Path $caseRoot 'bootstrap.ps1')
        $cloneAll = 'param([string]$TargetRoot)' + [Environment]::NewLine +
            'Write-Output "MOCK-CLONE-ALL TargetRoot=$TargetRoot"' + [Environment]::NewLine + "exit $childExit"
        Set-Content -LiteralPath (Join-Path $map 'clone-all.ps1') -Value $cloneAll
        $runner = @(
            '$ErrorActionPreference = "Stop"',
            'function git { Write-Output ("MOCK-GIT " + ($args -join " ")); $global:LASTEXITCODE = 0 }',
            '& (Join-Path $PSScriptRoot "bootstrap.ps1") -TargetRoot (Join-Path $PSScriptRoot "targets")',
            'Write-Output "RUNNER-COMPLETED"'
        ) -join [Environment]::NewLine
        $runnerPath = Join-Path $caseRoot 'runner.ps1'
        Set-Content -LiteralPath $runnerPath -Value $runner
        $output = & $powerShell -NoProfile -File $runnerPath 2>&1 | Out-String
        $code = $LASTEXITCODE
        if (!$output.Contains('pull --ff-only') -or !$output.Contains("TargetRoot=$(Join-Path $caseRoot 'targets')")) {
            throw "Bootstrap did not call the mocked pull/clone pass correctly. $output"
        }
        if ($childExit -eq 0) {
            if ($code -ne 0 -or !$output.Contains('RUNNER-COMPLETED')) { throw "Successful bootstrap failed. $output" }
        } elseif ($code -eq 0 -or $output.Contains('RUNNER-COMPLETED')) {
            throw "Failed clone pass was incorrectly reported as success (process exit $code). $output"
        }
        Write-Output "PASS bootstrap-child-exit-$childExit"
    }
    Write-Output '2 bootstrap regressions passed; no network calls or existing checkout changes.'
} finally {
    # Only remove the specific temporary fixture root created above.
    Remove-Item -LiteralPath $scenarioRoot -Recurse -Force
}
