up: docker-up
init: docker-down-clear docker-pull docker-build docker-up app-init
test: app-test
lint: app-lint

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans

docker-down-clear:
	docker-compose down -v --remove-orphans

docker-pull:
	docker-compose pull

docker-build:
	docker-compose build

app-init: app-composer-install app-composer-update

app-composer-install:
	docker-compose run --rm app-php-cli composer install

app-composer-update:
	docker-compose run --rm app-php-cli composer update

app-test:
	docker-compose run --rm app-php-cli php bin/phpunit

symfony-check:
	docker-compose run --rm app-php-cli symfony check:requirements

sec-check:
	docker-compose run --rm app-php-cli symfony check:security

app-lint:
	docker-compose run --rm app-php-cli composer lint