# ⚙️ Ollama Configuration Guide

Advanced configuration options for optimizing Ollama on your system.

## Environment Variables

### Windows (PowerShell)

```powershell
# Set permanently (user level)
[Environment]::SetEnvironmentVariable("OLLAMA_HOST", "0.0.0.0:11434", "User")
[Environment]::SetEnvironmentVariable("OLLAMA_NUM_GPU", "999", "User")
[Environment]::SetEnvironmentVariable("OLLAMA_MODELS", "D:\OllamaModels", "User")

# Set for current session only
$env:OLLAMA_HOST = "0.0.0.0:11434"
$env:OLLAMA_NUM_GPU = 999
```

### Linux/macOS

```bash
# Add to ~/.bashrc or ~/.zshrc
export OLLAMA_HOST=0.0.0.0:11434
export OLLAMA_NUM_GPU=999
export OLLAMA_MODELS=/path/to/models
```

## Key Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `OLLAMA_HOST` | `127.0.0.1:11434` | Bind address for API server |
| `OLLAMA_MODELS` | `~/.ollama/models` | Model storage location |
| `OLLAMA_NUM_GPU` | auto | Number of GPU layers to use |
| `OLLAMA_NUM_PARALLEL` | `1` | Max parallel requests |
| `OLLAMA_MAX_LOADED_MODELS` | `1` | Max models loaded at once |
| `OLLAMA_KEEP_ALIVE` | `5m` | How long to keep models loaded |
| `OLLAMA_DEBUG` | `false` | Enable debug logging |

## GPU Optimization (RTX 3080 10GB)

### Maximize GPU Usage
```powershell
$env:OLLAMA_NUM_GPU = 999  # Use all available GPU layers
```

### Memory Management
```powershell
# Keep models loaded longer for faster responses
$env:OLLAMA_KEEP_ALIVE = "30m"

# Or unload immediately after use (save VRAM)
$env:OLLAMA_KEEP_ALIVE = "0"
```

## Custom Model Location

Move models to a different drive (useful for SSDs):

```powershell
# Windows
$env:OLLAMA_MODELS = "D:\OllamaModels"

# Create the directory
mkdir D:\OllamaModels
```

## API Server Configuration

### Expose to Network
```powershell
$env:OLLAMA_HOST = "0.0.0.0:11434"
```

⚠️ **Warning**: This exposes Ollama to your local network. Only use on trusted networks.

### Custom Port
```powershell
$env:OLLAMA_HOST = "127.0.0.1:8080"
```

## Modelfile Customization

Create custom model configurations:

```dockerfile
# Save as Modelfile
FROM dolphin-mistral:latest

# Set parameters
PARAMETER temperature 0.7
PARAMETER top_p 0.9
PARAMETER num_ctx 4096

# Set system prompt
SYSTEM """
You are a helpful AI assistant. You provide accurate, detailed responses.
"""
```

Build custom model:
```bash
ollama create my-custom-model -f Modelfile
```

## Performance Tuning

### Context Window
Larger context = more memory usage:

```dockerfile
# In Modelfile
PARAMETER num_ctx 8192   # Default is 2048
```

### Batch Size
```dockerfile
PARAMETER num_batch 512  # Increase for better throughput
```

## Troubleshooting

### Check GPU Detection
```bash
ollama run dolphin-mistral --verbose
# Look for "GPU layers: X/Y"
```

### View Logs
```powershell
# Windows
Get-Content "$env:LOCALAPPDATA\Ollama\logs\server.log" -Tail 50
```

### Reset Ollama
```powershell
# Stop Ollama service
Stop-Process -Name "ollama*" -Force

# Clear cache (keeps models)
Remove-Item "$env:LOCALAPPDATA\Ollama\*.json" -Force

# Restart
ollama serve
```

## Integration Examples

### Open WebUI (Docker)
```bash
docker run -d -p 7777:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v open-webui:/app/backend/data \
  --name open-webui \
  ghcr.io/open-webui/open-webui:main
```

### VS Code Integration
Use with Continue extension or Copilot alternatives that support Ollama.

### Python SDK
```python
import ollama

response = ollama.chat(model='dolphin-mistral', messages=[
    {'role': 'user', 'content': 'Hello!'}
])
print(response['message']['content'])
```
