#!/bin/sh

sh changeprojectname.sh $1

docker-compose run --rm -v $(pwd)/../:/code django django-admin startproject --template=djangodock/django/template $1 . 