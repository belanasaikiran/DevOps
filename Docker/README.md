## Docker CLI tools Installation:

1. update and install the following libraries

```bash
sudo apt update && \
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

2. add official GPG key for docker

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```


3. Install Docker

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli [containerd.io](http://containerd.io/)
```


> For Some systems, you can install docker by 
> ``` sudo apt install docker.io ```

4. Fixes during images pull down using docker

**Error:**

```bash
$ sudo docker pull hello-world
Using default tag: latest
Error response from daemon: Get "https://registry-1.docker.io/v2/": proxyconnect tcp: dial tcp 192.168.0.112:3128: connect: connection refused
```

Fix: `sudo vim /etc/systemd/system/docker.service.d/http-proxy.conf`

```bash
[Service]
ENV HTTP_PROXY="http://192.168.1.112:3128"
#add the device ip
```

### Use Docker without `sudo`

> solution:
> `sudo usermod -aG docker $USER`

> Add user to docker group

```
sudo groupadd docker

sudo gpasswd -a \$USER docker

docker run hello-world
```




### Quick Jump:

1. [Docker](/Docker/README.md)
2. [Kubernetes](/Kubernetes/README.md)
3. [NGINX-WebServer](/Kubernetes/README.md)
4. [Remote-SSH-VNC](/private-docker-image-secrets/README.md)
5. [Dashboard](/dashboard/README.md)



