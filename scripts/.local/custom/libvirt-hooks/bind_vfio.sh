#!/bin/bash

## Load the config file
source "/etc/libvirt/hooks/kvm.conf"

## Load vfio
modprobe vfio
modprobe vfio_iommu_type1
modprobe vfio_pci

## Unbind gpu from nvidia and bind to vfio
virsh nodedev-detach $VIRSH_GPU_VIDEO
virsh nodedev-detach $VIRSH_GPU_AUDIO
virsh nodedev-detach $VIRSH_GPU_USB
virsh nodedev-detach $VIRSH_GPU_SERIAL

## Isolate CPU cores as per set variable
systemctl set-property --runtime -- user.slice AllowedCPUs=$VM_ISOLATED_CPUS
systemctl set-property --runtime -- system.slice AllowedCPUs=$VM_ISOLATED_CPUS
systemctl set-property --runtime -- init.scope AllowedCPUs=$VM_ISOLATED_CPUS

sleep 1
