#!/bin/bash
sudo apt update
sudo apt install -y apt-transport-https
curl -s \
    https://packages.cloud.google.com/apt/doc/apt-key.gpg |\
    sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo \
    "deb http://apt.kubernetes.io/ kubernetes-xenial main" |\
    sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubeadm=1.15.0-00  kubelet=1.15.0-00 kubectl=1.15.0-00
