#!/bin/sh

python manage.py wait_for_db
python manage.py initadmin
python manage.py migrate --no-input
python manage.py collectstatic
gunicorn panna.wsgi:application --bind 0.0.0.0:8000
