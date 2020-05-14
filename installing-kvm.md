Installing qemu/kvm on debian
=============================

 sudo apt -y install qemu-kvm libvirt-daemon  bridge-utils virtinst libvirt-daemon-system
  sudo apt -y install virt-top libguestfs-tools libosinfo-bin  qemu-system virt-manager

 export LIBVIRT_DEFAULT_URI='qemu:///system'
  virsh --connect qemu:///system list --all
   virsh --connect qemu:///session start buster-amd64
   
Installing a debian vm inside kvm
=================================

Using command line
------------------

virt-install --virt-type kvm --name buster-amd64 --cdrom ~/debian-10.0.0-amd64-netinst.iso --os-variant debian10 --disk size=10 --memory 1000

Graphical
---------

In Deb10 KDE
 - Open Virtual Machine Manager from
 Applications -> System -> Manage Virtual Machine

It is then intuitive..