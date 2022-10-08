FROM rockylinux:9.0
USER root

COPY . /usr/flask-app/
RUN /bin/python3.9 -m venv /usr/flask-app/venv
RUN ls -la /usr/flask-app/app
RUN /usr/flask-app/venv/bin/pip install -U -r /usr/flask-app/app/requirements.txt
WORKDIR /usr/flask-app/
ENTRYPOINT [ "/usr/flask-app/venv/bin/gunicorn", "-b 0.0.0.0:5000", "wsgi:app" ]
