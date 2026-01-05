# 🦙 OllamaSetup

Local LLM setup scripts and configuration for Ollama with recommended uncensored models optimized for RTX 3080 (10GB VRAM).

## Quick Start

### Windows
```powershell
# Install Ollama
.\install-ollama.ps1

# Pull recommended models
.\pull-models.ps1
```

### Linux/macOS
```bash
# Install Ollama
chmod +x install-ollama.sh
./install-ollama.sh

# Pull recommended models
chmod +x pull-models.sh
./pull-models.sh
```

## Features

- 🚀 One-click Ollama installation
- 📦 Curated model list for uncensored/unrestricted use
- 💾 Optimized for 10GB VRAM (RTX 3080)
- 🔧 Easy setup and configuration

## Requirements

- **GPU**: NVIDIA RTX 3080 (10GB) or similar
- **RAM**: 32GB+ recommended for hybrid models
- **Storage**: 50GB+ for models
- **OS**: Windows 10/11, Linux, or macOS

## Documentation

- [MODELS.md](MODELS.md) - Recommended models and sizing guide
- [CONFIGURATION.md](CONFIGURATION.md) - Advanced configuration options

## Usage

After installation, run Ollama:
```bash
# Best for coding/VS Code
ollama run qwen3-coder:30b

# Fast uncensored chat
ollama run dolphin3
```

Or use with an API:
```bash
curl http://localhost:11434/api/generate -d '{
  "model": "qwen2.5-coder:14b",
  "prompt": "Write a Python function to read a JSON file"
}'
```

## License

MIT License - See [LICENSE](LICENSE)
