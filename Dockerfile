# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown_registry node CheckpointLoaderSimple - no aux_id provided, skipping installation
# Could not resolve unknown_registry node TextEncodeQwenImageEditPlus - no aux_id provided, skipping installation
# Could not resolve unknown_registry node TextEncodeQwenImageEditPlus - no aux_id provided, skipping installation
# Could not resolve unknown_registry node ConditioningZeroOut - no aux_id provided, skipping installation
# Could not resolve unknown_registry node ResizeImagesByLongerEdge - no aux_id provided, skipping installation

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Phr00t/Qwen-Image-Edit-Rapid-AIO/blob/main/v21/Qwen-Rapid-AIO-NSFW-v21.safetensors --relative-path models/checkpoints --filename Phr00t__Qwen-Image-Edit-Rapid-AIO__Qwen-Rapid-AIO-NSFW-v21.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/blob/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/blob/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors --relative-path models/diffusion_models --filename z_image_turbo_bf16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/blob/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
