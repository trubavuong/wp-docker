#!/bin/bash

STACK_NAME=project_name

ensureDir() {
	if [ ! -d "$1" ]; then
		exit 1
	fi
}

cdDir() {
	ensureDir $1
	cd $1
}

composeStackName() {
	local name=$STACK_NAME
	name+="_"
	name+=$(basename "$PWD")
	echo $name
}

startWordPress() {
	cdDir $1
	echo "Starting services..."
	docker-compose -f ../docker-compose.yml -p $(composeStackName) up --build -d
}

stopWordPress() {
	cdDir $1
	echo "Stopping services..."
	docker-compose -f ../docker-compose.yml -p $(composeStackName) down
}

installWordPress() {
	cdDir $1
	echo "Running WordPress installation process..."
	docker-compose -f ../docker-compose.yml -p $(composeStackName) run --rm wp /usr/local/bin/wp-cli-custom/install-wp.sh
}

case "$1" in
	"start")
		startWordPress $2
		;;
	"stop")
		stopWordPress $2
		;;
	"install-wp")
		installWordPress $2
		;;
	*)
		echo "Usage: sudo services.sh (start|stop|install-wp) <wp-docker-env-dir>"
		;;
esac
