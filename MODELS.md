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

## 🏅 Top 2025 Ollama Models (Community Ranked)

Models released in 2025 that received the most community acclaim from r/ollama, r/LocalLLaMA, and X/Twitter.

### 🥇 Tier 1: Game Changers

| Model | Size | Type | Released | Why It's Top Ranked |
|-------|------|------|----------|---------------------|
| `deepseek-r1` | 1.5B-671B | 🧠 Reasoning | Jan 2025 | ⭐ **Model of the Year** - Matches OpenAI o1/o3 performance, fully open weights, reasoning chains visible |
| `qwen3` | 0.6B-235B | 🤖 General | May 2025 | Best overall open model family, thinking mode, MoE variants, multilingual |
| `qwen3-coder` | 30B-480B | 💻 Coding | May 2025 | ⭐ **Best Agentic Coder** - Long context, function calling, VS Code favorite |
| `gpt-oss` | 20B/120B | 🧠 Reasoning | Nov 2025 | OpenAI's first open weights model, strong agentic orchestration |
| `gemma3` | 270M-27B | 🤖 General | Mar 2025 | ⭐ **Best Single GPU Model** - Vision capable, runs on consumer hardware |

### 🥈 Tier 2: Excellent Performers

| Model | Size | Type | Released | Why It's Ranked |
|-------|------|------|----------|-----------------|
| `qwen3-vl` | 2B-235B | 👁️ Vision | Apr 2025 | Best open vision-language model, excellent image understanding |
| `gemma3n` | e2B/e4B | 📱 Edge | Jun 2025 | Designed for phones/tablets, selective parameter activation |
| `phi4` | 14B | 🧠 Reasoning | Jan 2025 | Microsoft's SOTA small model, great math/reasoning |
| `phi4-reasoning` | 14B | 🧠 Reasoning | May 2025 | Rivals larger models on complex reasoning tasks |
| `llama4` | 16x17B/128x17B | 👁️ Vision MoE | Mar 2025 | Meta's multimodal Scout and Maverick models |
| `mistral-small3.1` | 24B | 👁️ Vision | Mar 2025 | Vision + 128K context, excellent instruction following |
| `cogito` | 3B-70B | 🧠 Reasoning | Apr 2025 | Hybrid reasoning, outperforms same-size competitors |

### 🥉 Tier 3: Strong Contenders

| Model | Size | Type | Released | Why It's Ranked |
|-------|------|------|----------|-----------------|
| `deepseek-v3` | 671B | 🤖 MoE | Jan 2025 | Efficient MoE, 37B active params, strong general performance |
| `olmo-3` / `olmo-3.1` | 7B/32B | 🤖 General | Dec 2025 | Fully open source including training data, Claude-like conversations |
| `devstral` | 24B | 💻 Coding | Jun 2025 | Mistral's coding agent model, 80+ languages |
| `codestral:22b` | 22B | 💻 Coding | May 2024→2025 | Still top-tier for code gen, 80+ language support |
| `magistral` | 24B | 🧠 Reasoning | Jun 2025 | Efficient reasoning model with tool support |
| `granite3.3` / `granite4` | 2B-8B | 🛠️ Enterprise | Feb-Sep 2025 | IBM's enterprise-ready models, improved reasoning |
| `dolphin3` | 8B | 🔓 Uncensored | Jan 2025 | Function calling, modern Dolphin with agentic support |
| `r1-1776` | 70B/671B | 🧠 Reasoning | Feb 2025 | Perplexity's unbiased DeepSeek-R1 post-trained variant |
| `exaone-deep` | 2.4B-32B | 🧠 Reasoning | Apr 2025 | LG AI's reasoning models, strong math/coding |

### 🆕 Late 2025 Releases (December)

| Model | Size | Type | Released | Notes |
|-------|------|------|----------|-------|
| `minimax-m2` / `m2.1` | MoE | 💻 Coding | Dec 2025 | "Changed everything for agentic tasks" - community favorite |
| `glm-4.6` / `glm-4.7` | MoE | 🧠 Reasoning | Dec 2025 | Frontier performance claims, strong coding |
| `kimi-k2` | MoE | 💻 Coding | Dec 2025 | State-of-art on coding agent benchmarks |
| `deepseek-v3.1` / `v3.2` | 671B | 🧠 Hybrid | Nov-Dec 2025 | Thinking + non-thinking mode hybrid |
| `qwen3-next` | 80B MoE | 🤖 General | Dec 2025 | First Qwen3-Next installment, param efficient |
| `nemotron-3-nano` | 30B | 🛠️ Agentic | Dec 2025 | NVIDIA's new standard for efficient agents |

---

### 📊 2025 Models by Use Case (Quick Reference)

| Use Case | Top Pick | Runner-up | Budget Option |
|----------|----------|-----------|---------------|
| **Agentic/Tool Calling** | `minimax-m2` | `qwen3-coder:30b` | `dolphin3` |
| **Coding** | `qwen3-coder:30b` | `devstral:24b` | `codestral:22b` |
| **Reasoning** | `deepseek-r1:70b` | `gpt-oss:120b` | `phi4-reasoning` |
| **Vision** | `qwen3-vl:30b` | `gemma3:27b` | `llama3.2-vision:11b` |
| **General Chat** | `qwen3:32b` | `gemma3:12b` | `olmo-3:7b` |
| **Edge/Mobile** | `gemma3n:e4b` | `phi4-mini` | `qwen3:0.6b` |
| **Uncensored** | `deepseek-r1` | `dolphin3` | `dolphin-mistral` |

---

### 🗣️ Community Quotes (2025)

> *"DeepSeek R1 is a game changer. Matches o1 and runs locally."* — r/ollama

> *"MiniMax-M2 changed everything for agentic tasks. Light years ahead of Qwen and GLM."* — r/LocalLLaMA

> *"Qwen3 Coder 30b has been the most exciting release this year."* — r/LocalLLaMA Best of 2025

> *"GLM-4.6 is stronger for my work with forward and reverse engineering."* — r/LocalLLaMA

> *"gpt-oss-120b was the first open model that usefully raised the bar for agentic orchestration."* — r/LocalLLaMA

---

### ⚠️ 2025 Disappointments (Community Consensus)

| Model | Issue |
|-------|-------|
| Llama 4 | "Biggest disappointment" - didn't live up to hype |
| Some Granite variants | Output quality issues reported |
| Gemma 3n vision | GGUF vision not fully working |
| Qwen3 tool-calling | "Useless as a tool-calling platform" (some users) |

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

*Last updated: January 5, 2026*
