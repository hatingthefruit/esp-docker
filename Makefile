TAG = esp-docker-runner

install: build
	chmod +x esp-docker
	cp esp-docker $(HOME)/.local/bin/
	
build:
	docker build -t $(TAG) .