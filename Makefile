DOCKER			= docker
DOCKER_COMPOSE	= docker-compose

COMPOSE_FILE	= srcs/docker-compose.yml

all: build up

up:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d

build:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

start:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) start

stop:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) stop

down:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

restart:stop start

services:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) ps

images:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) images

volumes:
	$(DOCKER) volume ls

logs:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) logs

login-mariadb:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec mariadb bash

login-nginx:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec nginx bash

login-wordpress:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec wordpress bash

clean: stop
	$(DOCKER) container prune -f
	$(DOCKER) image prune -af
	$(DOCKER) volume prune -f
	$(DOCKER) network prune -f

fclean: clean
	rm -rf /home/hiono/data/databse/
	rm -rf /home/hiono/data/web/

re:fclean all

.PHONY: all up build start stop down restart \
		services images volumes logs \
		login-mariadb login-nginx login-wordpress \
		clean fclean re
