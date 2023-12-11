FROM python:3.9
COPY requirements.txt /requirements.txt
COPY service /service
WORKDIR /service
EXPOSE 8000

RUN apk add postgresql-client postgresql-dev build-base 

RUN pip install -r /requirements.txt 

RUN adduser --disabled-password --no-create-home ummad

USER ummad

CMD [ "python", "manage.py","runserver","0.0.0.0:8000" ]