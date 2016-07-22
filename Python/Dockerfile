FROM python:2.7
RUN pip install  Django==1.9 \
    && pip install Pillow==2.3.0 \
    && pip install mysqlclient==1.3.6
ADD ./Django /App/Django
WORKDIR /App/Django
EXPOSE 80
CMD [ "python", "manage.py", "runserver", "0.0.0.0:80" ]