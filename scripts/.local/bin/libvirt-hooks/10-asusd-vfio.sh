#!/bin/bash

## Use asusctl to set graphics mode to vfio
echo "Setting graphics mode to VFIO..."
asusctl graphics -m vfio

echo "Graphics mode set!"
sleep 1
