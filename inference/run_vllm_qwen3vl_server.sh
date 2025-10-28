# vllm==0.11.0
export VLLM_USE_V1=1
export WHISPER_MODEL_PATH="$MODEL"
# Model and environment settings
export CUDA_VISIBLE_DEVICES=0,4,5,7

MODEL="/scratch/vladimir_albrekht/qwen3_vl_moe/large_files/models/Qwen3-VL-30B-A3B-Instruct"


MODEL_SERVED_NAME="kita" 
PORT=6655
HOST="0.0.0.0"
SEED=0

# vLLM configuration parameters
GPU_MEMORY_UTILIZATION=0.90
TENSOR_PARALLEL_SIZE=4
DTYPE="bfloat16"
MAX_NUM_BATCHED_TOKENS=4096 # 32768 vs 4096
MAX_MODEL_LEN=4096
KV_CACHE_DTYPE="auto"
MAX_NUM_SEQS=50


CMD="vllm serve $MODEL \
  --tokenizer "$MODEL" \
  --host $HOST \
  --port $PORT \
  --served-model-name $MODEL_SERVED_NAME \
  --gpu-memory-utilization $GPU_MEMORY_UTILIZATION \
  --max-num-batched-tokens $MAX_NUM_BATCHED_TOKENS \
  --max-model-len $MAX_MODEL_LEN \
  --trust-remote-code \
  --dtype $DTYPE \
  --tensor-parallel-size $TENSOR_PARALLEL_SIZE \
  --kv-cache-dtype $KV_CACHE_DTYPE \
  --max-num-seqs $MAX_NUM_SEQS \
  --enable-prefix-caching \
  --enable-chunked-prefill \
  --seed $SEED"

# Execute the command
eval $CMD 2>&1 | grep -v -E "'WhisperTokenizer'|'Qwen2Tokenizer'|unexpected tokenization|'WhisperTokenizerFast'"