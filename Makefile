SHELL:= /bin/bash

COMPOSE = docker-compose
DC_FILE = srcs/docker-compose.yml

all: up

up:
	mkdir -p /home/rdelicad/data/wordpress
	mkdir -p /home/rdelicad/data/mariadb
	$(COMPOSE) -f $(DC_FILE) up -d --build

down:
	$(COMPOSE) -f $(DC_FILE) down

rebuild: down
	$(COMPOSE) -f $(DC_FILE) up -d --build

clean:
	$(COMPOSE) -f $(DC_FILE) down -v --rmi all --remove-orphans
	docker system prune -af

fclean: clean
	rm -rf /home/rdelicad/data/

re: fclean all

nginx:
	docker exec -it nginx /bin/bash

wordpress:
	docker exec -it wordpress /bin/bash

mariadb:
	docker exec -it mariadb /bin/bash

logs:
	$(COMPOSE) -f $(DC_FILE) logs -f

.PHONY: all up down rebuild clean fclean re exec_nginx exec_wordpress exec_mariadb logs

