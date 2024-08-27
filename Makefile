COMPOSE = docker-compose
DC_FILE = srcs/docker-compose.yml

all: up

up:
	mkdir -p /home/rdelicad/data/wordpress
	mkdir -p /home/rdelicad/data/mariadb
	mkdir -p /home/rdelicad/data/adminer
	mkdir -p /home/rdelicad/data/redis
	$(COMPOSE) -f $(DC_FILE) up -d --build

down:
	$(COMPOSE) -f $(DC_FILE) down

clean:
	$(COMPOSE) -f $(DC_FILE) down -v --rmi all --remove-orphans
	docker system prune -af

fclean: clean
	docker volume rm $(docker volume ls -q)
	
re: fclean all

nginx:
	docker exec -it nginx /bin/bash

wordpress:
	docker exec -it wordpress /bin/bash

mariadb:
	docker exec -it mariadb /bin/bash

adminer:
	docker exec -it adminer /bin/bash

ftp: 
	docker exec -it ftp /bin/bash

redis:
	docker exec -it redis /bin/bash

logs:
	$(COMPOSE) -f $(DC_FILE) logs -f

.PHONY: all up down clean fclean re nginx wordpress mariadb logs adminer ftp redis

