# ============================================================
# Pull Recommended Ollama Models
# Optimized for RTX 3080 (10GB VRAM)
# ============================================================

Write-Host "🦙 Ollama Model Downloader" -ForegroundColor Cyan
Write-Host "==========================" -ForegroundColor Cyan

# Check if Ollama is installed
$ollamaCheck = Get-Command ollama -ErrorAction SilentlyContinue
if (-not $ollamaCheck) {
    Write-Host "❌ Ollama is not installed. Run install-ollama.ps1 first." -ForegroundColor Red
    exit 1
}

# Recommended models for RTX 3080 (10GB VRAM)
$recommendedModels = @(
    @{ Name = "dolphin-mistral:latest"; Size = "4.1 GB"; Category = "General (Uncensored)" },
    @{ Name = "dolphin3:latest"; Size = "4.9 GB"; Category = "General (Uncensored)" },
    @{ Name = "llama2-uncensored:7b"; Size = "3.8 GB"; Category = "General (Uncensored)" },
    @{ Name = "dolphincoder:7b"; Size = "4.2 GB"; Category = "Coding" },
    @{ Name = "dolphincoder:15b"; Size = "9.1 GB"; Category = "Coding (Large)" }
)

# Optional large models (hybrid mode)
$hybridModels = @(
    @{ Name = "qwen3-coder:30b"; Size = "18 GB"; Category = "Coding (Hybrid)" }
)

Write-Host "`n📋 Recommended Models (fit in 10GB VRAM):" -ForegroundColor Yellow
foreach ($model in $recommendedModels) {
    Write-Host "   • $($model.Name) ($($model.Size)) - $($model.Category)" -ForegroundColor White
}

Write-Host "`n📋 Optional Hybrid Models (GPU + CPU offload):" -ForegroundColor Yellow
foreach ($model in $hybridModels) {
    Write-Host "   • $($model.Name) ($($model.Size)) - $($model.Category)" -ForegroundColor Gray
}

# Prompt for selection
Write-Host "`n🔧 Installation Options:" -ForegroundColor Cyan
Write-Host "   [1] Essential only (dolphin-mistral + dolphincoder:7b) ~8 GB" -ForegroundColor White
Write-Host "   [2] All recommended models ~26 GB" -ForegroundColor White
Write-Host "   [3] All + hybrid models ~44 GB" -ForegroundColor White
Write-Host "   [4] Custom selection" -ForegroundColor White
Write-Host "   [5] Cancel" -ForegroundColor White

$choice = Read-Host "`nSelect option (1-5)"

$modelsToInstall = @()

switch ($choice) {
    "1" {
        $modelsToInstall = @("dolphin-mistral:latest", "dolphincoder:7b")
    }
    "2" {
        $modelsToInstall = $recommendedModels | ForEach-Object { $_.Name }
    }
    "3" {
        $modelsToInstall = ($recommendedModels + $hybridModels) | ForEach-Object { $_.Name }
    }
    "4" {
        Write-Host "`nEnter model names separated by commas:" -ForegroundColor Yellow
        $input = Read-Host
        $modelsToInstall = $input -split ',' | ForEach-Object { $_.Trim() }
    }
    "5" {
        Write-Host "Cancelled." -ForegroundColor Gray
        exit 0
    }
    default {
        Write-Host "Invalid option. Exiting." -ForegroundColor Red
        exit 1
    }
}

# Pull models
Write-Host "`n🚀 Downloading models..." -ForegroundColor Green
$totalModels = $modelsToInstall.Count
$currentModel = 0

foreach ($model in $modelsToInstall) {
    $currentModel++
    Write-Host "`n[$currentModel/$totalModels] Pulling $model..." -ForegroundColor Cyan
    
    ollama pull $model
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ $model downloaded successfully!" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Failed to download $model" -ForegroundColor Red
    }
}

# Show installed models
Write-Host "`n📦 Installed Models:" -ForegroundColor Yellow
ollama list

Write-Host "`n🎉 Done! Start chatting with: ollama run dolphin-mistral" -ForegroundColor Green
