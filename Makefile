name        := gluedev/php-nginx
phpversion  := 7.2

.PHONY: build
build:
	docker build -t $(name):latest -t $(name):$(phpversion) .

.PHONY: push
push: build
	docker push $(name)