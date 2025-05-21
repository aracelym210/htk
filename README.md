# htk
Hack the Kube - A Docker container for K8s hacking

This project was started to have a lightweight toolbox to practice pentesting and purple-teaming
against Kubernetes environments -- specifically against [Kubernetes Goat](https://madhuakula.com/kubernetes-goat/docs/how-to-run/kubernetes-goat-on-gcp-google-cloud-platform) project in GCP.

## Usage 
This section describes an example workflow on how to use htk docker container against [kubernetes-goat](https://madhuakula.com/kubernetes-goat/docs/how-to-run/kubernetes-goat-on-gcp-google-cloud-platform). 

### K8s goat setup
The following instructions are a condensed list from the [setup page](https://madhuakula.com/kubernetes-goat/docs/how-to-run/kubernetes-goat-on-gcp-google-cloud-platform) of K8s Goat docs, and exclusively focuses on GKE. 

> Execute the following commands from within kubernetes-goat repo...

**1. Create cluster**
```
gcloud container clusters create k8s-goat-cluster --location=us-east1
```

**2. Generate kubeconfig entry for cluster in order to use kubectl**
```
gcloud container clusters get-credentials k8s-goat-cluster --zone us-east1
```

**3. Setup cluster**
```
bash setup-kubernetes-goat.sh
```

**4. Validate pods are running** 
```
kubectl get pods
```

**5. Setup access to pods** via port-forwarding
```
bash access-kubernetes-goat.sh
```

**6. Check if you can access via web browser**
http://localhost:1234

### Run htk 
Hack the kube is a kali based container with tools for hacking k8s

> Run from within htk repository... 

**1. Build the image**
```
docker build -t htk .
```

**2. Run container in interactive mode and mount host gcloud and .kube config**
```
docker run -it --rm --net=host -v $HOME/.kube:/root/.kube -v $HOME/.config/gcloud:/root/.config/gcloud --name htk htk:latest
```

**3. Authenticate into gcloud cli from inside container**
```
gcloud auth login
```

**4. Install gke-gcloud-auth-plugin**
> Required for `kubectl` use

```
gcloud components install gke-gcloud-auth-plugin
```

**5. Get pods to make sure container has proper access** 
```
kubectl get pods
``` 
