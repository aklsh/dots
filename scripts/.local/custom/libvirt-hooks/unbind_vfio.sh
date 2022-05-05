#!/bin/bash

ID1="0000:01:00.0"
ID2="0000:01:00.1"
ID3="0000:01:00.2"
ID4="0000:01:00.3"

echo "Unbind GPU from vfio driver"
sudo sh -c "echo -n $ID1 > /sys/bus/pci/drivers/vfio-pci/unbind" || echo "Failed to unbind $ID1"
sudo sh -c "echo -n $ID2 > /sys/bus/pci/drivers/vfio-pci/unbind" || echo "Failed to unbind $ID2"
sudo sh -c "echo -n $ID3 > /sys/bus/pci/drivers/vfio-pci/unbind" || echo "Failed to unbind $ID3"
sudo sh -c "echo -n $ID4 > /sys/bus/pci/drivers/vfio-pci/unbind" || echo "Failed to unbind $ID4"
echo "Bind GPU to nvidia driver"
sudo sh -c "echo -n $ID1 > /sys/bus/pci/drivers/nvidia/bind" || echo "Failed to bind $ID1"

# ## Unbind gpu from vfio and bind to nvidia
# virsh nodedev-reattach $VIRSH_GPU_VIDEO
# virsh nodedev-reattach $VIRSH_GPU_AUDIO
# virsh nodedev-reattach $VIRSH_GPU_USB
# virsh nodedev-reattach $VIRSH_GPU_SERIAL

# ## Unload vfio
# modprobe -r vfio_pci
# modprobe -r vfio_iommu_type1
# modprobe -r vfio

# ## Return CPU cores as per set variable
# systemctl set-property --runtime -- user.slice AllowedCPUs=$SYS_TOTAL_CPUS
# systemctl set-property --runtime -- system.slice AllowedCPUs=$SYS_TOTAL_CPUS
# systemctl set-property --runtime -- init.scope AllowedCPUs=$SYS_TOTAL_CPUS

# sleep 1
