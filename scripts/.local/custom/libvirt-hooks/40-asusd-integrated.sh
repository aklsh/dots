#!/bin/bash

## Use asusctl to set graphics mode to vfio
echo "Resetting graphics mode back to integrated..."
supergfxctl -m integrated

echo "Graphics mode reset!"
sleep 1
