# 🦙 Ollama Model Recommendations

Curated list of models optimized for RTX 3080 (10-12GB VRAM) + 48GB DDR5 RAM with focus on uncensored and coding models.

**Hardware Target:** RTX 3080 (10-12GB VRAM) | 48GB DDR5 6400MHz | Windows 11

**Total Installed:** 13 models (~120 GB)

---

## 📦 Installed Models (January 2026)

| Model | Size | Type | Run Mode | Tooling | Release Date |
|-------|------|------|----------|---------|--------------|
| `llama2-uncensored:7b` | 3.8 GB | 🔓 Uncensored | GPU | Chat | July 2023 |
| `wizard-vicuna-uncensored:7b` | 3.8 GB | 🔓 Uncensored | GPU | Chat, Roleplay | June 2023 |
| `dolphin-mistral:latest` | 4.1 GB | 🔓 Uncensored | GPU | Chat, Coding | Dec 2023 |
| `dolphincoder:7b` | 4.2 GB | 💻 Coding | GPU | Code Gen, Completion | Feb 2024 |
| `dolphin3:latest` | 4.9 GB | 🔓 Uncensored | GPU | Chat, Coding, Function Calling | Jan 2025 |
| `wizardlm-uncensored:latest` | 7.4 GB | 🔓 Uncensored | GPU | Chat, Instruction | May 2023 |
| `deepseek-coder-v2:16b` | 8.9 GB | 💻 Coding | GPU | Code Gen, Completion, MoE | June 2024 |
| `qwen2.5-coder:14b` | 9.0 GB | 💻 Coding | GPU | Code Gen, Completion, Multi-lang | Sept 2024 |
| `dolphincoder:15b` | 9.1 GB | 💻 Coding | GPU | Code Gen, Completion | Feb 2024 |
| `codestral:22b` | 12 GB | 💻 Coding | GPU/Hybrid | Code Gen, 80+ Languages | May 2024 |
| `qwen3-coder:30b` | 18 GB | 💻 Coding | Hybrid | Code Gen, Agentic, Long Context | May 2025 |
| `qwen3-vl:30b` | 19 GB | 👁️ Vision | Hybrid | Vision, Multi-modal | April 2025 |
| `dolphin-mixtral:8x7b` | 26 GB | 🔓 Uncensored | Hybrid | Chat, Coding, MoE | Jan 2024 |

---

## 🏆 Top Picks by Use Case

### 🔥 Best for VS Code / Agentic Coding (Recommended)
| Model | Why |
|-------|-----|
| `qwen3-coder:30b` | ⭐ **TOP PICK** - Best tool/function calling, agentic coding, long context |
| `codestral:22b` | Mistral's dedicated coding model, 80+ languages, fast |
| `qwen2.5-coder:14b` | Best balance of speed + quality, fits entirely in VRAM |

### ⚡ Fastest Coding (GPU-only, <10GB)
| Model | Why |
|-------|-----|
| `qwen2.5-coder:14b` | Best speed/quality ratio, multi-language support |
| `deepseek-coder-v2:16b` | MoE architecture, very capable, fits VRAM |
| `dolphincoder:15b` | Uncensored + good coding, fits in 10GB |

### 🔓 Best Uncensored (Fast)
| Model | Why |
|-------|-----|
| `dolphin3:latest` | Latest Dolphin, function calling, 8B params |
| `dolphin-mistral:latest` | Classic choice, reliable, 7B |
| `wizard-vicuna-uncensored:7b` | Great for roleplay/creative |

### 🧠 Best Uncensored (Powerful, Hybrid)
| Model | Why |
|-------|-----|
| `dolphin-mixtral:8x7b` | Most capable uncensored, MoE architecture |

### 👁️ Vision / Multi-modal
| Model | Why |
|-------|-----|
| `qwen3-vl:30b` | Powerful vision-language model |

---

## 📊 Run Mode Explanation

| Mode | Description | Speed |
|------|-------------|-------|
| **GPU** | Fits entirely in VRAM (<12GB) | ⚡ Fast (50+ tok/s) |
| **GPU/Hybrid** | Mostly GPU, some CPU offload (12-15GB) | 🔥 Good (30-50 tok/s) |
| **Hybrid** | Split between GPU + RAM (>15GB) | 🐢 Slower (10-30 tok/s) |

---

## 🔧 Tooling Support Legend

| Symbol | Capability |
|--------|------------|
| 💻 Code Gen | Code generation and completion |
| 🔧 Function Calling | Can call external functions/tools |
| 👁️ Vision | Image understanding |
| 🔓 Uncensored | No content filtering |
| 🧠 MoE | Mixture of Experts architecture |
| 📝 Long Context | 32K+ token context window |

---

## 💾 VRAM Usage Guide (RTX 3080 10-12GB)

### ✅ Fits Entirely in VRAM (GPU-only)
- All 7B models (~3.8-4.5 GB)
- All 13B models (~7-8 GB)  
- 14-16B models (~8.9-9.1 GB)

### ⚠️ Partial GPU Offload (GPU/Hybrid)
- 22B models (~12-13 GB)
- Some layers run on CPU RAM

### 🔄 Heavy Hybrid (GPU + CPU RAM)
- 30B+ models (18-20 GB)
- Mixtral 8x7B (26 GB)
- Slower but leverages your 48GB RAM

---

## 🛠️ Model Management Commands

```bash
# List installed models
ollama list

# Pull a model
ollama pull dolphin-mistral

# Remove a model
ollama rm gemma2:2b

# Show model info (includes file location)
ollama show dolphin-mistral --modelfile

# Run a model interactively
ollama run qwen2.5-coder:14b

# Copy/rename a model
ollama cp dolphin-mistral my-dolphin
```

---

## ⚡ Performance Tips

1. **For agentic/VS Code work**: Use `qwen3-coder:30b` (best tool calling)
2. **For fast iteration**: Use `qwen2.5-coder:14b` (fits in VRAM)
3. **Use Q4_K_M quantization** for good quality/size balance
4. **Close other GPU apps** when running larger models
5. **Set `OLLAMA_NUM_GPU=999`** to maximize GPU layers
6. **Use `--verbose`** flag to see token/s speeds
7. **Hybrid models** (18GB+) leverage your 48GB RAM alongside GPU

---

## 🔧 Environment Variables

```powershell
# Windows PowerShell
$env:OLLAMA_NUM_GPU = 999
$env:OLLAMA_HOST = "0.0.0.0:11434"
$env:OLLAMA_MODELS = "D:\ollama Models"  # Custom model path
```

```bash
# Linux/macOS
export OLLAMA_NUM_GPU=999
export OLLAMA_HOST=0.0.0.0:11434
export OLLAMA_MODELS="/path/to/models"
```

---

## 📍 Model Storage Location

Models are stored at: `D:\ollama Models\blobs\`

To check disk usage:
```powershell
Get-ChildItem "D:\ollama Models" -Recurse | Measure-Object -Property Length -Sum
```

---

*Last updated: January 4, 2026*
