#!/bin/sh

docker run --rm -v $(pwd)/../:/code -w /code python:3 bash -c "pip install -r djangodock/django/requirements.txt && django-admin startproject --template djangodock/django/template -e ini ${1} ."
