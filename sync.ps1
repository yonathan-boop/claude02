# sync.ps1 - Sinkronisasi konfigurasi Claude 02 ke GitHub
param (
    [string]$Message = "Update sistem Claude 02: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
)

$ClaudeDir = $PSScriptRoot
Set-Location -Path $ClaudeDir

$HomeClaude = "$HOME\.claude"

# 1. Sync CLAUDE.md
if (Test-Path "$HomeClaude\CLAUDE.md") {
    Copy-Item -Path "$HomeClaude\CLAUDE.md" -Destination "$ClaudeDir\CLAUDE.md" -Force
}

# 2. Sync agents
if (Test-Path "$HomeClaude\agents") {
    Copy-Item -Path "$HomeClaude\agents\*" -Destination "$ClaudeDir\agents" -Recurse -Force
}

# 3. Sync hooks
if (Test-Path "$HomeClaude\hooks") {
    Copy-Item -Path "$HomeClaude\hooks\*" -Destination "$ClaudeDir\hooks" -Recurse -Force
}

# 4. Sync memory
$MemorySrc = "$HomeClaude\projects\C--Users-yonat\memory"
if (Test-Path $MemorySrc) {
    Copy-Item -Path "$MemorySrc\*" -Destination "$ClaudeDir\memory" -Force
    Write-Host "[OK] Memory synced." -ForegroundColor Green
}

# 5. Sync rules
if (Test-Path "$HomeClaude\rules") {
    if (-not (Test-Path "$ClaudeDir\rules")) { New-Item -ItemType Directory -Path "$ClaudeDir\rules" -Force | Out-Null }
    Copy-Item -Path "$HomeClaude\rules\*" -Destination "$ClaudeDir\rules" -Recurse -Force
    Write-Host "[OK] Rules synced." -ForegroundColor Green
}

# 6. Sync settings.json
if (Test-Path "$HomeClaude\settings.json") {
    Copy-Item -Path "$HomeClaude\settings.json" -Destination "$ClaudeDir\settings.json" -Force
    Write-Host "[OK] Settings synced." -ForegroundColor Green
}

# 7. Git status check & push ke claude02
git add -A
$Changes = git status --porcelain
if ($Changes) {
    git commit -m $Message
    git push -u origin main
    Write-Host "[OK] Berhasil push update ke https://github.com/yonathan-boop/claude02" -ForegroundColor Green
} else {
    Write-Host "[INFO] Tidak ada perubahan untuk di-commit." -ForegroundColor Cyan
}
