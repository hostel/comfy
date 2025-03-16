#!/bin/bash

source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/chrisgoringe/cg-use-everywhere"
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes"
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/city96/ComfyUI_ExtraModels"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
    "https://github.com/chflame163/ComfyUI_LayerStyle"
    "https://github.com/sergekatzmann/ComfyUI_Nimbus-Pack"
    "https://github.com/TinyTerra/ComfyUI_tinyterraNodes"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    "https://github.com/sipherxyz/comfyui-art-venture"
    "https://github.com/crystian/ComfyUI-Crystools"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/kijai/ComfyUI-Florence2"
    "https://github.com/city96/ComfyUI-GGUF"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/ltdrdata/ComfyUI-Impact-Subpack"
    "https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch"
    "https://github.com/Acly/comfyui-inpaint-nodes"
    "https://github.com/john-mnz/ComfyUI-Inspyrenet-Rembg"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/Layer-norm/comfyui-lama-remover"
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/shadowcz007/comfyui-mixlab-nodes"
    "https://github.com/receyuki/comfyui-prompt-reader-node"
    "https://github.com/kijai/ComfyUI-SUPIR"
    "https://github.com/shiimizu/ComfyUI-TiledDiffusion"
    "https://github.com/pythongosssss/ComfyUI-WD14-Tagger"
    "https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes"
    "https://github.com/jags111/efficiency-nodes-comfyui"
    "https://github.com/BadCafeCode/masquerade-nodes-comfyui"
    "https://github.com/SeargeDP/SeargeSDXL"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
)

WORKFLOWS=(
)

CHECKPOINT_MODELS=(
)

UNET_MODELS=(
)

LORA_MODELS=(
)

VAE_MODELS=(
)

UPSCALE_MODELS=(
)

CONTROLNET_MODELS=(
)

CLIP_MODELS=(
)

CLIP_VISION_MODELS=(
)

function transfer_start_files() {
    START_DIR="${WORKSPACE}/start"
    if [[ -d "$START_DIR" ]]; then
        echo "Found directory start: $START_DIR"

        if [[ -d "$START_DIR/workflows" ]]; then
            TARGET_WORKFLOWS="${COMFYUI_DIR}/user/default/workflows"
            echo "Moving content $START_DIR/workflows in $TARGET_WORKFLOWS"
            mv "$START_DIR/workflows/"* "$TARGET_WORKFLOWS/"
        else
            echo "Directory workflows not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/input" ]]; then
            TARGET_INPUT="${COMFYUI_DIR}/input"
            echo "Moving content $START_DIR/input in $TARGET_INPUT"
            mv "$START_DIR/input/"* "$TARGET_INPUT/"
        else
            echo "Directory input not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/loras" ]]; then
            TARGET_LORAS="${COMFYUI_DIR}/models/loras"
            echo "Moving content $START_DIR/loras in $TARGET_LORAS"
            mv "$START_DIR/loras/"* "$TARGET_LORAS/"
        else
            echo "Directory loras not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/checkpoints" ]]; then
            TARGET_CHECKPOINTS="${COMFYUI_DIR}/models/checkpoints"
            echo "Moving content $START_DIR/checkpoints in $TARGET_CHECKPOINTS"
            mv "$START_DIR/checkpoints/"* "$TARGET_CHECKPOINTS/"
        else
            echo "Directory checkpoints not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/clip" ]]; then
            TARGET_CLIP="${COMFYUI_DIR}/models/clip"
            echo "Moving content $START_DIR/clip in $TARGET_CLIP"
            mv "$START_DIR/clip/"* "$TARGET_CLIP/"
        else
            echo "Directory clip not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/clip_vision" ]]; then
            TARGET_CLIP_VISION="${COMFYUI_DIR}/models/clip_vision"
            echo "Moving content $START_DIR/clip_vision in $TARGET_CLIP_VISION"
            mv "$START_DIR/clip_vision/"* "$TARGET_CLIP_VISION/"
        else
            echo "Directory clip_vision not found in $START_DIR"
        fi


        if [[ -d "$START_DIR/controlnet" ]]; then
            TARGET_CONTROLNET="${COMFYUI_DIR}/models/controlnet"
            echo "Moving content $START_DIR/controlnet in $TARGET_CONTROLNET"
            mv "$START_DIR/controlnet/"* "$TARGET_CONTROLNET/"
        else
            echo "Directory controlnet not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/upscale_models" ]]; then
            TARGET_UPSCALE="${COMFYUI_DIR}/models/upscale_models"
            echo "Moving content $START_DIR/upscale_models in $TARGET_UPSCALE"
            mv "$START_DIR/upscale_models/"* "$TARGET_UPSCALE/"
        else
            echo "Directory upscale_models not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/vae" ]]; then
            TARGET_VAE="${COMFYUI_DIR}/models/vae"
            echo "Moving content $START_DIR/vae in $TARGET_VAE"
            mv "$START_DIR/vae/"* "$TARGET_VAE/"
        else
            echo "Directory vae not found in $START_DIR"
        fi

    else
        echo "Directory start not found in ${WORKSPACE}"
    fi
}

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/upscale_models" \
        "${UPSCALE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/clip" \
        "${CLIP_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/clip_vision" \
        "${CLIP_VISION_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
        sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
        pip install --no-cache-dir ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip install --no-cache-dir -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip install --no-cache-dir -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_download() {
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif 
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    if [[ -n $auth_token ]];then
        wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    fi
}

# Выполняем процесс provisioning, если не задан флаг отключения
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi

# В самом конце выполняем перенос файлов из каталога start
transfer_start_files
