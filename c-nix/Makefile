up: ## Run the image
	@nix build .
	@docker load < result
	@docker run -i -v /var/run/docker.sock:/var/run/docker.sock c-nix

help: ## See a list of all available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.* ?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: all $(MAKECMDGOALS)

.DEFAULT_GOAL := help
