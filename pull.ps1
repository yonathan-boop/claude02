# pull-apply.ps1 - Tarik update dari GitHub dan terapkan langsung ke .claude lokal
param ()

$RepoDir = $PSScriptRoot
Set-Location -Path $RepoDir

Write-Host "[1/3] Menarik update terbaru dari GitHub..." -ForegroundColor Cyan
git pull origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Gagal menarik data dari remote." -ForegroundColor Red
    exit 1
}

Write-Host "[2/3] Menerapkan pembaruan ke C:\Users\yonat\.claude..." -ForegroundColor Cyan
$ClaudeTarget = "$HOME\.claude"

# Copy CLAUDE.md
if (Test-Path "$RepoDir\CLAUDE.md") {
    Copy-Item -Path "$RepoDir\CLAUDE.md" -Destination "$ClaudeTarget\CLAUDE.md" -Force
}

# Copy Agents
if (Test-Path "$RepoDir\agents") {
    Copy-Item -Path "$RepoDir\agents\*" -Destination "$ClaudeTarget\agents" -Recurse -Force
}

# Copy Hooks
if (Test-Path "$RepoDir\hooks") {
    Copy-Item -Path "$RepoDir\hooks\*" -Destination "$ClaudeTarget\hooks" -Recurse -Force
}

# Copy Skills
if (Test-Path "$RepoDir\skills") {
    Copy-Item -Path "$RepoDir\skills\*" -Destination "$ClaudeTarget\skills" -Recurse -Force
}

# Copy Memory
if (Test-Path "$RepoDir\memory") {
    Copy-Item -Path "$RepoDir\memory\*" -Destination "$ClaudeTarget\memory" -Force
    Copy-Item -Path "$RepoDir\memory\*" -Destination "$ClaudeTarget\projects\C--Users-yonat\memory" -Force
}

Write-Host "[3/3] Selesai. Seluruh konfigurasi Claude lokal telah diperbarui." -ForegroundColor Green
