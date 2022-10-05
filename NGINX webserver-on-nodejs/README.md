# Kubernetes: add NGINX webserver and nodejs together:

I guess you want to use nginx as a reverse proxy to your Node.js app. If it is the case, you can use one of the following ways to achieve it.

**Option 1**

1. Build nginx and your node.js app into one Docker image. In this image, configure nginx as a reverse proxy and forward the request to your node.js app. For example, the following nginx configure forwards the request to port 3000 in the same container.
    
    ```
    server {
        listen      80;
        server_name localhost;
    
        location / {
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass  http://127.0.0.1:3000;
        }
    }
    
    ```
    
2. You can then deploy this image to k8s cluster, and create a service for it.

**Option 2**

1. Create 2 docker images: 1 for nginx and 1 for your node.js.
2. Deploy both of them to k8s and create a service for each of them. Use `ClusterIP` as the service type for node.js image, and `LoadBalancer` for nginx image.
3. Configure nginx as the reverse proxy, and forward the request to the corresponding cluster ip of the service for node.js image.

To test it on minikube, Option 1 is easier. Option 2 is recommended for a production k8s cluster.

Reference: 

[Kubernetes: add NGINX webserver](https://stackoverflow.com/questions/49777552/kubernetes-add-nginx-webserver/49778305)