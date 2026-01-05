#!/bin/bash
# ============================================================
# Pull Recommended Ollama Models
# Optimized for RTX 3080 (10GB VRAM)
# ============================================================

echo "🦙 Ollama Model Downloader"
echo "=========================="

# Check if Ollama is installed
if ! command -v ollama &> /dev/null; then
    echo "❌ Ollama is not installed. Run install-ollama.sh first."
    exit 1
fi

# Recommended models
ESSENTIAL_MODELS=(
    "dolphin-mistral:latest"
    "dolphincoder:7b"
)

RECOMMENDED_MODELS=(
    "dolphin-mistral:latest"
    "dolphin3:latest"
    "llama2-uncensored:7b"
    "dolphincoder:7b"
    "dolphincoder:15b"
)

HYBRID_MODELS=(
    "qwen3-coder:30b"
)

echo ""
echo "📋 Recommended Models (fit in 10GB VRAM):"
echo "   • dolphin-mistral:latest (4.1 GB) - General (Uncensored)"
echo "   • dolphin3:latest (4.9 GB) - General (Uncensored)"
echo "   • llama2-uncensored:7b (3.8 GB) - General (Uncensored)"
echo "   • dolphincoder:7b (4.2 GB) - Coding"
echo "   • dolphincoder:15b (9.1 GB) - Coding (Large)"

echo ""
echo "📋 Optional Hybrid Models (GPU + CPU offload):"
echo "   • qwen3-coder:30b (18 GB) - Coding (Hybrid)"

echo ""
echo "🔧 Installation Options:"
echo "   [1] Essential only (dolphin-mistral + dolphincoder:7b) ~8 GB"
echo "   [2] All recommended models ~26 GB"
echo "   [3] All + hybrid models ~44 GB"
echo "   [4] Cancel"

read -p "Select option (1-4): " choice

case $choice in
    1)
        MODELS_TO_INSTALL=("${ESSENTIAL_MODELS[@]}")
        ;;
    2)
        MODELS_TO_INSTALL=("${RECOMMENDED_MODELS[@]}")
        ;;
    3)
        MODELS_TO_INSTALL=("${RECOMMENDED_MODELS[@]}" "${HYBRID_MODELS[@]}")
        ;;
    4)
        echo "Cancelled."
        exit 0
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac

# Pull models
echo ""
echo "🚀 Downloading models..."
total=${#MODELS_TO_INSTALL[@]}
current=0

for model in "${MODELS_TO_INSTALL[@]}"; do
    ((current++))
    echo ""
    echo "[$current/$total] Pulling $model..."
    
    if ollama pull "$model"; then
        echo "   ✅ $model downloaded successfully!"
    else
        echo "   ❌ Failed to download $model"
    fi
done

# Show installed models
echo ""
echo "📦 Installed Models:"
ollama list

echo ""
echo "🎉 Done! Start chatting with: ollama run dolphin-mistral"
