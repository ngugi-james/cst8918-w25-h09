# **CST8918 – Hybrid-H09: Deploying an AKS Cluster with Terraform**

## **Overview**
In this lab, we deployed an **Azure Kubernetes Service (AKS) cluster** using **Terraform** and deployed a **microservices-based store application** with multiple services, including:

- **RabbitMQ**
- **Order Service**
- **Product Service**
- **Store Front**

---

## **Steps Performed**
### **1️. Provisioned the AKS Cluster with Terraform**
- Defined infrastructure in `main.tf` using Terraform.
- Used `terraform apply` to create:
  - **AKS Cluster**
  - **Resource Group**
  - **Node Pool**
- Retrieved the **kubeconfig** to interact with the cluster.

### **2️. Deployed Microservices to AKS**
- Applied Kubernetes YAML files to deploy:
  - `RabbitMQ`
  - `Order-Service`
  - `Product-Service`
  - `Store-Front`
- Exposed the frontend via a **LoadBalancer Service**.

### **3️. Debugged Product-Service Issues**
- Encountered `CrashLoopBackOff` due to **low memory limits**.
- Increased **CPU and memory** requests/limits in `product-service`.
- Deleted the failing pod and restarted it.

### **4️. Verified Application Deployment**
- Used `kubectl get pods` to check pod status.

### **5️. Cleaned Up Infrastructure**
- Used `kubectl delete pod` to restart failing pods.
- Used `terraform destroy -auto-approve` to remove AKS resources.
