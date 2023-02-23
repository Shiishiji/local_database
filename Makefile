# Misc
.DEFAULT_GOAL = help
.PHONY        = help init leave ip pg

## —— The Makefile ——————————————————————————————————
help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'


## —— Manage local docker swarm ——————————————————————————————————
init: ## Initialize the swarm (this node joins)
	docker swarm init

leave: ## Leave the swarm (this node leaves)
	docker swarm leave --force

services: ## Get list of running services
	docker service ls

ip: ## Get docker swarm ip
	docker node inspect self --format '{{ .Status.Addr  }}'

restart-docker: ## Restarts docker
	sudo systemctl stop docker
	sudo systemctl start docker

## —— Postgresql boot-up ——————————————————————————————————
pg: ## Boots up pg database with adminer
	docker stack deploy -c postgresql/stack.yml postgres

pg-inspect:
	docker service inspect postgres_db

## —— RabbitMQ boot-up ——————————————————————————————————
rabbit: ## Boots up rabbit
	docker stack deploy -c rabbitmq/stack.yml rabbitmq

rabbit-inspect:
	docker service inspect rabbitmq_rabbitmq
