# 🦙 Ollama Model Recommendations

Curated list of models optimized for RTX 3080 (10GB VRAM) with focus on uncensored/unrestricted models.

## Current Models Evaluation

| Model | Size | Keep/Remove | Reason |
|-------|------|-------------|--------|
| `gemma2:2b` | 1.6 GB | ❌ Remove | Too small, not uncensored |
| `qwen3:4b` | 2.5 GB | ❌ Remove | Too small for serious use |
| `llama2-uncensored:7b` | 3.8 GB | ✅ Keep | Good uncensored base |
| `dolphin-mistral:latest` | 4.1 GB | ✅ Keep | Good uncensored 7B |
| `dolphincoder:7b` | 4.2 GB | ✅ Keep | Good for coding |
| `dolphin3:latest` | 4.9 GB | ✅ Keep | Latest Dolphin |
| `dolphincoder:15b` | 9.1 GB | ✅ Keep | Fits in VRAM |
| `qwen3-coder:30b` | 18 GB | ⚠️ Hybrid | Too big for VRAM, runs hybrid |

## Recommended Models by Category

### 🎯 General Purpose (Uncensored)
| Model | Size | Notes |
|-------|------|-------|
| `dolphin-mistral:latest` | 4.1 GB | Best all-around uncensored 7B |
| `dolphin3:latest` | 4.9 GB | Latest Dolphin, very capable |
| `llama2-uncensored:7b` | 3.8 GB | Classic uncensored option |
| `dolphin-llama3:8b` | 4.7 GB | Uncensored Llama 3 base |

### 💻 Coding Models
| Model | Size | Notes |
|-------|------|-------|
| `dolphincoder:7b` | 4.2 GB | Good balance of speed/quality |
| `dolphincoder:15b` | 9.1 GB | Best that fits in 10GB VRAM |
| `deepseek-coder:6.7b` | 3.8 GB | Fast coding assistant |
| `codellama:7b` | 3.8 GB | Meta's code model |

### 🧠 Large Models (Hybrid/Offload)
| Model | Size | Notes |
|-------|------|-------|
| `qwen3-coder:30b` | 18 GB | Excellent coder, needs offload |
| `dolphin-mixtral:8x7b` | 26 GB | Very capable, hybrid mode |
| `deepseek-coder:33b` | 19 GB | Top-tier coding, hybrid |

## VRAM Usage Guide

### Fits Entirely in 10GB VRAM
- All 7B models (~4-5 GB)
- Most 13B models (~7-8 GB)
- Some 15B models (~9 GB)

### Requires Hybrid (GPU + CPU)
- 30B+ models
- Mixtral 8x7B
- Any model > 10GB

## Model Management Commands

```bash
# List installed models
ollama list

# Pull a model
ollama pull dolphin-mistral

# Remove a model
ollama rm gemma2:2b

# Show model info
ollama show dolphin-mistral

# Copy/rename a model
ollama cp dolphin-mistral my-dolphin
```

## Performance Tips

1. **Stick to 7B-15B models** for best speed on RTX 3080
2. **Use Q4_K_M quantization** for good quality/size balance
3. **Close other GPU apps** when running larger models
4. **Set `OLLAMA_NUM_GPU=999`** to maximize GPU layers
5. **Use `--verbose`** flag to see token/s speeds

## Environment Variables

```bash
# Linux/macOS
export OLLAMA_NUM_GPU=999
export OLLAMA_HOST=0.0.0.0:11434

# Windows PowerShell
$env:OLLAMA_NUM_GPU = 999
$env:OLLAMA_HOST = "0.0.0.0:11434"
```
