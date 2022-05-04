up: docker-up
init: docker-down-clear docker-pull docker-build docker-up app-composer-install
test: app-test
check: lint phpcs psalm

update:
	docker-compose run --rm app-php-cli composer update

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

app-composer-install:
	docker-compose run --rm app-php-cli composer install

app-test:
	docker-compose run --rm app-php-cli php bin/phpunit

symfony-check:
	docker-compose run --rm app-php-cli symfony check:requirements

sec-check:
	docker-compose run --rm app-php-cli symfony check:security

lint:
	docker-compose run --rm app-php-cli composer lint

phpcs:
	docker-compose run --rm app-php-cli composer cs-check

psalm:
	docker-compose run --rm app-php-cli composer psalm