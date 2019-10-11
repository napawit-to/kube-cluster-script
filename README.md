# init cluster

sudo su -

swapoff -a

sudo kubeadm init \
    --pod-network-cidr=10.244.0.0/16
    
exit

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf \
    $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Remove Kub

kubeadm reset

sudo apt-get purge kubeadm kubectl kubelet kubernetes-cni kube*   

sudo apt-get autoremove  

sudo rm -rf ~/.kube
