$ErrorActionPreference = 'Stop'

Set-Location (Split-Path -Parent $PSScriptRoot)

$branch = git rev-parse --abbrev-ref HEAD 2>$null
if (-not $branch) {
    Write-Host 'Não foi possível identificar a branch atual.'
    exit 1
}

Write-Host "Branch atual: $branch"
Write-Host '--- STATUS ---'
git status --short --branch

$hasChanges = $false
$diffCheck = git diff --quiet --ignore-submodules -- .
if ($LASTEXITCODE -ne 0) { $hasChanges = $true }

$cachedCheck = git diff --cached --quiet --ignore-submodules -- .
if ($LASTEXITCODE -ne 0) { $hasChanges = $true }

if (-not $hasChanges) {
    Write-Host 'Nenhuma alteração pendente. Fazendo apenas pull e push.'
    git pull --rebase origin $branch
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    git push origin $branch
    exit $LASTEXITCODE
}

$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm'
git add .
git commit -m "chore: sync from VS Code at $timestamp"
if ($LASTEXITCODE -ne 0) {
    Write-Host 'Nenhuma alteração a confirmar.'
    exit 0
}

git pull --rebase origin $branch
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git push origin $branch
exit $LASTEXITCODE
