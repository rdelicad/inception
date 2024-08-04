SHELL:= /bin/bash

COMPOSE = docker compose
DC_FILE = srcs/docker-compose.yml

all: up

up:
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb
	$(COMPOSE) -f $(DC_FILE) up -d --build

down:
	$(COMPOSE) -f $(DC_FILE) down

clean:
	$(COMPOSE) -f $(DC_FILE) down
	docker system prune -af

fclean: clean
	rm -rf /home/$(USER)/data/mariadb
	rm -rf /home/$(USER)/data/wordpress

re: fclean all

exec_nginx:
	docker exec -it nginx-container /bin/bash

exec_wordpress:
	docker exec -it wordpress-container /bin/bash

exec_mariadb:
	docker exec -it mariadb-container /bin/bash

logs:
	$(COMPOSE) -f $(DC_FILE) logs -f

.PHONY: all up down clean fclean re exec_nginx exec_wordpress exec_mariadb logs

