#!/bin/sh

sed -i '' "s/module = .*/module = ${1}.wsgi/g" django/uwsgi.ini