# Kubernetes

## Installing Kubernetes CLI tools:

1. Installing the kubernetes command line tools

```bash
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

1. Disabling Swap:

   ```bash
   sudo swapoff -a
   ```

1. Initiating a master node on one of the servers by ignoring swap.

```bash
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```

3. Make sure no other K8s services are online(they might use the ports you are using which would end up causing problems at pod network initiation or joining pods.
4. In our case, MicroK8s are active, so we stop it using `sudo microk8s.stop`
5. Error: **kubeadm init shows kubelet isn't running or healthy**

​ **FIX:** [https://stackoverflow.com/questions/52119985/kubeadm-init-shows-kubelet-isnt-running-or-healthy](https://stackoverflow.com/questions/52119985/kubeadm-init-shows-kubelet-isnt-running-or-healthy)

​ `create a file :`/etc/docker/daemon.json`

​ Content:

```bash
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
{
  "dns": ["8.8.8.8", "8.8.4.4"]
}
```

```bash
 sudo systemctl daemon-reload
 sudo systemctl restart docker
 sudo systemctl restart kubelet

```

6. On successful initiation of master node, join the other worker nodes to master using the token generated at master node:

​ In my case, the generated token is:

```bash
kubeadm join 192.168.0.112:6443 --token 4bh1s5.1r9y4yd01hpaetlp --discovery-token-ca-cert-hash sha256:e89e942e1d9dc5463045c7231dd3d01d026abde4bf953534ee182632ee62f39a
```

​ Note: You can also generate token and print the join command:

`kubeadm token create --print-join-command`

7. Check whether the worker node joined the master node,
8. `for development purpose only`, we consider the master node to run pods too.

​ run the following command to taint the master and run pods in it.

```bash
kubectl taint nodes <node_name> node-role.kubernetes.io/master-
```

9. On Master: `kubectl get nodes`

It should list the nodes connected to master like this:

```bash
kubectl get nodes
NAME      STATUS     ROLES                  AGE     VERSION
server1   NotReady   <none>                 26s     v1.22.4
server2   NotReady   control-plane,master   5m52s   v1.23.0
```

10. Installing the network plugin so the master can create network bridges to communicate with pods.

Here, We can use Calico or Flannel network plugin from

```bash
curl https://docs.projectcalico.org/manifests/calico.yaml -O
kubectl apply -f calico.yaml
```

​ **OR**

```bash
curl [https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml](https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml) -O
kubectl apply -f kube-flannel.yml
```

11. Note: If the network plugin and CoreDNS are stuck at **creating State,** add the folllowing lines to /etc/resolv.conf

```bash
sudo nano /etc/resolve.conf
nameserver 8.8.8.8
nameserver 8.8.4.4

Reference: https://github.com/coredns/coredns/issues/3681#issuecomment-592997864
```

12. check the nodes status now to make sure they are in ready state

```bash
kubectl get nodes -o wide
NAME      STATUS   ROLES                  AGE   VERSION
server1   Ready    <none>                 21m   v1.22.4
server2   Ready    control-plane,master   26m   v1.23.0
```

13. check the health of kube-cluster with

```bash
kubectl cluster-info
```

14. Installing a Metrics server

```bash
kubectl apply -f https://raw.githubusercontent.com/scriptcamp/kubeadm-scripts/main/manifests/metrics-server.yaml
```





### Quick Jump:

1. [Docker](/Docker/README.md)
2. [Kubernetes](/Kubernetes/README.md)
3. [NGINX-WebServer](/NGINX webserver-on-nodejs/README.md)
4. [Remote-SSH-VNC](/private-docker-image-secrets/README.md)
5. [Dashboard](/dashboard/README.md)
