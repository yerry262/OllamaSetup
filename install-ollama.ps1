# ============================================================
# Ollama Installation Script for Windows
# ============================================================

Write-Host "🦙 Ollama Installation Script" -ForegroundColor Cyan
Write-Host "==============================" -ForegroundColor Cyan

# Check if running as admin
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    Write-Host "⚠️  Note: Running without admin privileges. Some features may be limited." -ForegroundColor Yellow
}

# Check if Ollama is already installed
$ollamaPath = Get-Command ollama -ErrorAction SilentlyContinue

if ($ollamaPath) {
    Write-Host "✅ Ollama is already installed at: $($ollamaPath.Source)" -ForegroundColor Green
    $version = ollama --version
    Write-Host "   Version: $version" -ForegroundColor Gray
    
    $response = Read-Host "Do you want to reinstall/update? (y/N)"
    if ($response -ne 'y' -and $response -ne 'Y') {
        Write-Host "Exiting..." -ForegroundColor Gray
        exit 0
    }
}

# Download and install Ollama
Write-Host "`n📥 Downloading Ollama installer..." -ForegroundColor Yellow

$installerUrl = "https://ollama.com/download/OllamaSetup.exe"
$installerPath = "$env:TEMP\OllamaSetup.exe"

try {
    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath -UseBasicParsing
    Write-Host "✅ Download complete!" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to download Ollama: $_" -ForegroundColor Red
    exit 1
}

# Run installer
Write-Host "`n🚀 Running Ollama installer..." -ForegroundColor Yellow
Write-Host "   Please follow the installation prompts." -ForegroundColor Gray

Start-Process -FilePath $installerPath -Wait

# Verify installation
Write-Host "`n🔍 Verifying installation..." -ForegroundColor Yellow

# Refresh PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

$ollamaCheck = Get-Command ollama -ErrorAction SilentlyContinue

if ($ollamaCheck) {
    Write-Host "✅ Ollama installed successfully!" -ForegroundColor Green
    $version = ollama --version
    Write-Host "   Version: $version" -ForegroundColor Gray
    
    Write-Host "`n📋 Next steps:" -ForegroundColor Cyan
    Write-Host "   1. Run .\pull-models.ps1 to download recommended models" -ForegroundColor White
    Write-Host "   2. Or manually: ollama pull dolphin-mistral" -ForegroundColor White
    Write-Host "   3. Start chatting: ollama run dolphin-mistral" -ForegroundColor White
} else {
    Write-Host "⚠️  Installation may require a terminal restart." -ForegroundColor Yellow
    Write-Host "   Close and reopen PowerShell, then run: ollama --version" -ForegroundColor Gray
}

# Cleanup
Remove-Item $installerPath -ErrorAction SilentlyContinue

Write-Host "`n🎉 Done!" -ForegroundColor Green
