#!/bin/bash

## Use asusctl to set graphics mode to vfio
echo "Setting graphics mode to VFIO..."
supergfxctl -m vfio

echo "Graphics mode set!"
sleep 1
