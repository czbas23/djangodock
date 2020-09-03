#!/bin/sh

if [ "$DJANGO_DB_ENGINE" = "django.db.backends.postgresql" ]
then
  echo "Waiting for postgres..."

  while ! nc -z $DJANGO_DB_HOST $DJANGO_DB_PORT; do
    sleep 0.1
  done

  echo "PostgreSQL started"
fi

python manage.py migrate
python manage.py collectstatic --noinput

if [ -f "/code/uwsgi.ini" ]; then
  uwsgi --ini /code/uwsgi.ini
else 
  python manage.py runserver 0.0.0.0:8000
fi

exec "$@"