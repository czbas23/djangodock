ARG DJANGO_PYTHON_VERSION="3.8.5"

FROM python:${DJANGO_PYTHON_VERSION}

RUN mkdir /code
WORKDIR /code

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ARG DJANGO_DATABASE="postgresql"

RUN apt-get update && apt-get install -y netcat

RUN pip install --upgrade pip

RUN pip install uWSGI

# install database
RUN if [ "$DJANGO_DATABASE" = "postgresql" ] ; then \
        apt-get install -y libpq-dev postgresql postgresql-contrib \
            && pip install psycopg2-binary psycopg2 ; \
    elif [ "$DJANGO_DATABASE" = "mysql" ] ; then \
        apt-get install -y default-libmysqlclient-dev \
            && pip install mysqlclient ; \
    fi

# install dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY uwsgi.ini /uwsgi.ini
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8000

CMD /entrypoint.sh