help:
	@echo "Targets:"
	@echo "  install     Install dependencies"
	@echo "  deploy      Deploy to AKS"
	@echo "  clean       Clean up"

install:
	sudo apt update
	sudo apt install -y terraform ansible kubectl

deploy:
	kubectl apply -f infrastructure/kubernetes/overlays/prod/

clean:
	kubectl delete -f infrastructure/kubernetes/overlays/dev/
