FROM rockylinux:9.0
USER root

COPY ./ /flask-app/
RUN /bin/python3.9 -m venv /flask-app/venv
RUN ls -la /flask-app
RUN /flask-app/venv/bin/pip install -U -r /opt/falsk-app/app/requirements.txt
WORKDIR /flask-app/app
ENTRYPOINT [ "/flask-app/venv/bin/gunicorn -b localhost:5000 app:app" ]
