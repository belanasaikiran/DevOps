#! /bin/bash

echo "$(tput setaf 2)updating and installing transport-https,  curl  packages"

sudo apt-get update && sudo apt-get install -y apt-transport-https curl

echo "$(tput setaf 2)downloading and installing  apt source for kubernetes from cloud.google.com"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

echo "$(tput setaf 2)adding kubernetes source list"
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update

sudo apt install docker.io -y



echo "$(tput setaf 2)install kubernetes"
sudo apt-get install -y kubelet kubeadm kubectl

echo "$(tput setaf 2)holding kubernetes updates "
sudo apt-mark hold kubelet kubeadm kubectl


echo "$(tput setaf 2)disabling linux swap"
sudo swapoff -a

# adding docker daemon json file for kubernetes storage drivers

cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF


echo "$(tput setaf 2)restarting docker"

 sudo systemctl daemon-reload
 sudo systemctl restart docker
 sudo systemctl restart kubelet
