#!/bin/bash

# =====================================
# Swap Space Creation Script
# Student Name: [Your Name]
# Roll Number:  [Your Roll Number]
# =====================================

# Write your commands below

# Define swap file path and size
SWAP_PATH="/swapfile"
SWAP_SIZE="1G"

# 1. Allocate space for the swap file (fallocate is fast; dd is a fallback)
sudo fallocate -l $SWAP_SIZE $SWAP_PATH || sudo dd if=/dev/zero of=$SWAP_PATH bs=1M count=1024 status=progress

# 2. Set strict file permissions (only root should read/write swap)
sudo chmod 600 $SWAP_PATH

# 3. Format the allocated file as Linux swap
sudo mkswap $SWAP_PATH

# 4. Activate the swap file immediately
sudo swapon $SWAP_PATH

# 5. Append to /etc/fstab to make swap persistent across system reboots
echo "$SWAP_PATH none swap sw 0 0" | sudo tee -a /etc/fstab

# 6. Verify the active swap space
echo -e "\n--- Current Active Swap ---"
sudo swapon --show
