## setup our lovely env

```bash
uv venv --python 3.12 --seed .venv
uva # source .venv/bin/activate
git clone https://github.com/vladimiralbrekhtccr/Qwen3-VL.git
cd Qwen3-VL
uv pip install vllm==0.11.0
uv pip install flash-attn==2.7.4.post1 --no-build-isolation
uv pip install -r qwen-vl-finetune/requirements.txt
```

## do some magic run vllm_Qwen3VL_serve

```bash
bash inference/run_vllm_qwen3vl_server.sh
```

### simple request to out kita

run inf inside `inference/send_requests_qwen3vl.ipynb`

