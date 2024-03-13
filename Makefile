NAME=ghcr.io/uenob/cron-logrotate:latest

cron-logrotate.tar: Dockerfile
	docker buildx build -t $(NAME) .
	docker save -o $@ $(NAME)
	docker rmi $(NAME)
