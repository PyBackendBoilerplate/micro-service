# Taken originally from: https://github.com/adriencaccia/vscode-flask-debug

.PHONY: help
.DEFAULT_GOAL := help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'


## Build tools
install: ## setup the flask Docker container, install the requirements...
	docker-compose build

clean:   ## Clean __pycache__ files
	py3clean .


## Start the Dockerized flask application in local environment
gunicorn:      ## gunicorn and hot-reload
	docker-compose run --rm -e VSCODE_DEBUG_MODE=False --service-ports service_name gunicorn --config "src/config/gunicorn_conf.py" "src.app:app"

gunicorndebug: ## gunicorn, hot-reload and VS Code debugger
	docker-compose run --rm -e VSCODE_DEBUG_MODE=True --service-ports service_name gunicorn --config "src/config/gunicorn_conf.py" "src.app:app"
	
flask:         ## flask and hot-reload
	docker-compose run --rm -e VSCODE_DEBUG_MODE=False --service-ports service_name flask run

flaskdebug:    ## flask, hot-reload and VS Code debugger
	docker-compose run --rm -e VSCODE_DEBUG_MODE=True --service-ports service_name flask run
