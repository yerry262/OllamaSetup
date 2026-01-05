# ============================================================
# Remove Small/Unnecessary Ollama Models
# ============================================================

Write-Host "🦙 Ollama Model Cleanup" -ForegroundColor Cyan
Write-Host "=======================" -ForegroundColor Cyan

# Check if Ollama is installed
$ollamaCheck = Get-Command ollama -ErrorAction SilentlyContinue
if (-not $ollamaCheck) {
    Write-Host "❌ Ollama is not installed." -ForegroundColor Red
    exit 1
}

# Models to remove (too small or not useful)
$modelsToRemove = @(
    "gemma2:2b",
    "qwen3:4b"
)

Write-Host "`n📋 Models flagged for removal:" -ForegroundColor Yellow
foreach ($model in $modelsToRemove) {
    Write-Host "   • $model" -ForegroundColor Gray
}

Write-Host "`n⚠️  This will free up disk space but remove these models." -ForegroundColor Yellow
$confirm = Read-Host "Continue? (y/N)"

if ($confirm -ne 'y' -and $confirm -ne 'Y') {
    Write-Host "Cancelled." -ForegroundColor Gray
    exit 0
}

# Remove models
Write-Host "`n🗑️  Removing models..." -ForegroundColor Red

foreach ($model in $modelsToRemove) {
    Write-Host "   Removing $model..." -ForegroundColor Gray
    $result = ollama rm $model 2>&1
    
    if ($result -match "deleted") {
        Write-Host "   ✅ Removed $model" -ForegroundColor Green
    } elseif ($result -match "not found") {
        Write-Host "   ⏭️  $model not installed, skipping" -ForegroundColor Yellow
    } else {
        Write-Host "   ❌ Failed to remove $model" -ForegroundColor Red
    }
}

# Show remaining models
Write-Host "`n📦 Remaining Models:" -ForegroundColor Yellow
ollama list

Write-Host "`n🎉 Cleanup complete!" -ForegroundColor Green
