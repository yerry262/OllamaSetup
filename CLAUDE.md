# OllamaSetup

## Project Overview

Local LLM setup scripts and configuration for Ollama with recommended uncensored models optimized for RTX 3080 (10GB VRAM). Streamlines the process of running open-source language models locally.

## Features

- **Automated Setup**: Installation scripts for quick Ollama setup
- **Model Recommendations**: Curated list of uncensored models
- **GPU Optimization**: Tuned for RTX 3080 (10GB VRAM)
- **Configuration Templates**: Pre-configured settings for optimal performance
- **Local Inference**: Run LLMs entirely on your hardware

## Tech Stack

- **Ollama**: Open-source local LLM runtime
- **GPU**: NVIDIA RTX 3080 optimization
- **Models**: Various open-source LLMs (Llama, Mistral, etc.)
- **Scripts**: Bash/Python automation

## Hardware Requirements

- **GPU**: NVIDIA RTX 3080 (10GB VRAM) minimum
- **RAM**: 16GB+ system RAM recommended
- **Storage**: 50GB+ for models
- **OS**: Linux, macOS, or Windows (WSL)

## Quick Start

```bash
# Clone and run setup script
git clone https://github.com/yerry262/OllamaSetup
cd OllamaSetup
bash install.sh

# Update your desired model IDs
# Run and interact with local LLMs
```

## Recommended Models

Models optimized for RTX 3080 performance:
- **Llama 2 7B/13B**: Good general-purpose models
- **Mistral 7B**: Fast and capable
- **Neural Chat**: Conversation-optimized
- **Custom uncensored variants**: Available in docs

## Configuration

- Model quantization levels (Q4, Q5, Q8)
- Context window settings
- Token generation limits
- Temperature and sampling parameters

## Performance Tips

- Use Q4 quantization for RTX 3080 to max out context
- Enable GPU acceleration (CUDA)
- Monitor VRAM usage with nvidia-smi
- Adjust batch size based on available memory

## Code Style

- Well-documented setup scripts
- Clear variable naming
- Modular configuration files

## Known Limitations

- Limited to RTX 3080 specs (can adapt for other GPUs)
- Offline operation only
- Model inference speed depends on quantization
- No distributed inference setup

## Future Enhancements

- Support for other GPU models (A100, H100, etc.)
- Web UI integration (Ollama Web)
- Model fine-tuning scripts
- Multi-GPU setup documentation

## Last Updated

2026-07-05
