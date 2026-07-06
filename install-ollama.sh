#!/bin/bash
# ============================================================
# Ollama Installation Script for Linux/macOS
# ============================================================

echo "🦙 Ollama Installation Script"
echo "=============================="

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     PLATFORM=Linux;;
    Darwin*)    PLATFORM=Mac;;
    *)          PLATFORM="UNKNOWN:${OS}"
esac

echo "📍 Detected platform: $PLATFORM"

# Check if Ollama is already installed
if command -v ollama &> /dev/null; then
    echo "✅ Ollama is already installed"
    ollama --version
    
    read -p "Do you want to reinstall/update? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting..."
        exit 0
    fi
fi

# Install Ollama
echo ""
echo "📥 Installing Ollama..."

if [[ "$PLATFORM" == "Linux" ]]; then
    curl -fsSL https://ollama.com/install.sh | sh

    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ Ollama installed successfully!"
        ollama --version

        echo ""
        echo "📋 Next steps:"
        echo "   1. Run ./pull-models.sh to download recommended models"
        echo "   2. Or manually: ollama pull dolphin-mistral"
        echo "   3. Start chatting: ollama run dolphin-mistral"
    else
        echo "❌ Installation failed"
        exit 1
    fi
elif [[ "$PLATFORM" == "Mac" ]]; then
    echo "ℹ️  The Ollama install script (install.sh) only supports Linux."
    echo "   On macOS, install Ollama using one of the following:"
    echo "   • Download the app: https://ollama.com/download/mac"
    echo "   • Or with Homebrew:  brew install ollama"
    echo ""
    echo "📋 After installing, run ./pull-models.sh to download recommended models."
    exit 0
else
    echo "❌ Unsupported platform: $PLATFORM"
    echo "   Please install manually from: https://ollama.com/download"
    exit 1
fi

echo ""
echo "🎉 Done!"
