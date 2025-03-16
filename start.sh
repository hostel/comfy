#!/bin/bash

function transfer_start_files() {
    COMFYUI_DIR=${WORKSPACE}/ComfyUI
    START_DIR="${WORKSPACE}/start"
    if [[ -d "$START_DIR" ]]; then
        echo "Found directory start: $START_DIR"

        TARGET_WORKFLOWS="${COMFYUI_DIR}/user/default/workflows"
        if [[ ! -d "$TARGET_WORKFLOWS" ]]; then
            echo "Target workflows directory not found. Creating $TARGET_WORKFLOWS."
            mkdir -p "$TARGET_WORKFLOWS"
        fi
        if [[ -d "$START_DIR/workflows" ]]; then
            echo "Moving content from $START_DIR/workflows to $TARGET_WORKFLOWS"
            mv "$START_DIR/workflows/"* "$TARGET_WORKFLOWS/"
        else
            echo "Directory workflows not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/input" ]]; then
            TARGET_INPUT="${COMFYUI_DIR}/input"
            echo "Moving content from $START_DIR/input to $TARGET_INPUT"
            mv "$START_DIR/input/"* "$TARGET_INPUT/"
        else
            echo "Directory input not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/loras" ]]; then
            TARGET_LORAS="${COMFYUI_DIR}/models/loras"
            echo "Moving content from $START_DIR/loras to $TARGET_LORAS"
            mv "$START_DIR/loras/"* "$TARGET_LORAS/"
        else
            echo "Directory loras not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/checkpoints" ]]; then
            TARGET_CHECKPOINTS="${COMFYUI_DIR}/models/checkpoints"
            echo "Moving content from $START_DIR/checkpoints to $TARGET_CHECKPOINTS"
            mv "$START_DIR/checkpoints/"* "$TARGET_CHECKPOINTS/"
        else
            echo "Directory checkpoints not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/clip" ]]; then
            TARGET_CLIP="${COMFYUI_DIR}/models/clip"
            echo "Moving content from $START_DIR/clip to $TARGET_CLIP"
            mv "$START_DIR/clip/"* "$TARGET_CLIP/"
        else
            echo "Directory clip not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/clip_vision" ]]; then
            TARGET_CLIP_VISION="${COMFYUI_DIR}/models/clip_vision"
            echo "Moving content from $START_DIR/clip_vision to $TARGET_CLIP_VISION"
            mv "$START_DIR/clip_vision/"* "$TARGET_CLIP_VISION/"
        else
            echo "Directory clip_vision not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/controlnet" ]]; then
            TARGET_CONTROLNET="${COMFYUI_DIR}/models/controlnet"
            echo "Moving content from $START_DIR/controlnet to $TARGET_CONTROLNET"
            mv "$START_DIR/controlnet/"* "$TARGET_CONTROLNET/"
        else
            echo "Directory controlnet not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/upscale_models" ]]; then
            TARGET_UPSCALE="${COMFYUI_DIR}/models/upscale_models"
            echo "Moving content from $START_DIR/upscale_models to $TARGET_UPSCALE"
            mv "$START_DIR/upscale_models/"* "$TARGET_UPSCALE/"
        else
            echo "Directory upscale_models not found in $START_DIR"
        fi

        if [[ -d "$START_DIR/vae" ]]; then
            TARGET_VAE="${COMFYUI_DIR}/models/vae"
            echo "Moving content from $START_DIR/vae to $TARGET_VAE"
            mv "$START_DIR/vae/"* "$TARGET_VAE/"
        else
            echo "Directory vae not found in $START_DIR"
        fi


        TARGET_IPADAPTER="${COMFYUI_DIR}/models/ipadapter"
        if [[ ! -d "$TARGET_IPADAPTER" ]]; then
            echo "Target workflows directory not found. Creating $TARGET_IPADAPTER."
            mkdir -p "$TARGET_IPADAPTER"
        fi
        if [[ -d "$START_DIR/ipadapter" ]]; then
            echo "Moving content from $START_DIR/workflows to $TARGET_IPADAPTER"
            mv "$START_DIR/ipadapter/"* "$TARGET_IPADAPTER/"
        else
            echo "Directory ipadapter not found in $START_DIR"
        fi

    else
        echo "Directory start not found in ${WORKSPACE}"
    fi
}

transfer_start_files