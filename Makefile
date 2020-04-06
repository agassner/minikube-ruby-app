all: run

build:
	docker build -t agassner/minikube-ruby-app:latest .

run: build
	docker run --rm -it -p 8080:8080 agassner/minikube-ruby-app:latest

minikube_clean_up:
	kubectl delete service/minikube-ruby-app-deployment
	kubectl delete deployment/minikube-ruby-app-deployment
	sleep 5

run_on_minikube: minikube_clean_up
	# Start Minikube
	minikube start --vm-driver virtualbox
	sleep 5

	# Deploy the app
	kubectl apply -f deployment.yaml
	sleep 15

	# Create a Service
	kubectl expose deployment minikube-ruby-app-deployment --type=LoadBalancer --port=8080
	sleep 15

	# Make the Service accessible
	minikube service minikube-ruby-app-deployment
