# Djangodock

$ git submodule add https://github.com/czbas23/djangodock.git
$ cd djangodock
$ cp env_example .env
$ sh startproject.sh myproject
$ docker-compose build nginx django postgres
$ docker-compose up -d nginx django postgres