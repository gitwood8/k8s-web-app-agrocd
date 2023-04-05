# k8s-php-app-3

Status of Last Deployment:<br>
<img src="https://github.com/gitwood8/k8s-php-app-1/workflows/***************/badge.svg?branch=main"><br>

My hint:
1. *Our deployment has been already started and now i change image and record it:*
**kubectl set image deployment/php-app-v1 web-application-v1=wood8/myk8sphp_app:version2 -n web-app --record**
**kubectl set image deployment/php-app-v1 web-application-v1=wood8/myk8sphp_app:latest -n web-app --record**
2. *Show recorded history*
**kubectl rollout history deployment/php-app-v1 -n web-app**
3. *Rollout to previous version*
**kubectl rollout undo deployment/php-app-v1 -n web-app --to-revision=3**

Dont forget to launch ingress controller pod before run an ingress:
*minikube enable addons ingress*

Set default namespace:   
*kubectl config set-context --current --namespace=web-app*


----- k8s Dashboard deploy -----
==================================
**Need to install for each Cluster.**
**Warning: The sample user created in the tutorial will have administrative privileges and is for educational purposes only.**

Doc: 
https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

Creating a sample user: 
https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md

----- Apply yaml -----
----------------------
apiVersion: v1  
kind: ServiceAccount  
metadata:  
  name: admin-user  
  namespace: kubernetes-dashboard  
#---  
apiVersion: rbac.authorization.k8s.io/v1  
kind: ClusterRoleBinding  
metadata:  
  name: admin-user  
roleRef:  
  apiGroup: rbac.authorization.k8s.io  
  kind: ClusterRole  
  name: cluster-admin  
subjects:  
#- kind: ServiceAccount  
  name: admin-user  
  namespace: kubernetes-dashboard  

----- Get token  -----
----------------------
kubectl -n kubernetes-dashboard create token admin-user

----- Start proxy -----
----------------------
kubectl proxy
#open another terminal

----- Open link and pust token -----
----------------------
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/


----- Argo CD Deploy Windows -----
==================================

----- Execute Installation -----
----------------------
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml

----- Forward port  -----
----------------------
kubectl port-forward svc/argocd-server -n argocd 8080:443
#open another terminal

----- Open Browser -----
----------------------
localhost:8080

To LogIn install CLI
----------------------

echo $version = (Invoke-RestMethod https://api.github.com/repos/argoproj/argo-cd/releases/latest).tag_name
$url = "https://github.com/argoproj/argo-cd/releases/download/v2.6.7/argocd-windows-amd64.exe"
$output = "argocd.exe"

Invoke-WebRequest -Uri $url -OutFile $output

----- To get passworf for UI -----
----------------------
argocd admin initial-password -n argocd