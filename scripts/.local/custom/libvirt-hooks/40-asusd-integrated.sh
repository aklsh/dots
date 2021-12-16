#!/bin/bash

## Use asusctl to set graphics mode to vfio
echo "Resetting graphics mode back to integrated..."
asusctl graphics -m integrated

echo "Graphics mode reset!"
sleep 1
