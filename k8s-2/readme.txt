1. Our deployment has been already started and now i change image and record it:
kubectl set image deployment/php-app-v1 web-application-v1=wood8/myk8sphp_app:version2 -n web-app --record
kubectl set image deployment/php-app-v1 web-application-v1=wood8/myk8sphp_app:latest -n web-app --record
2. Show recorded history
kubectl rollout history deployment/php-app-v1 -n web-app
3. Rollout to previous version
kubectl rollout undo deployment/php-app-v1 -n web-app --to-revision=3

Dont forget to launch ingress controller pod before run an ingress:
minikube enable addons ingress