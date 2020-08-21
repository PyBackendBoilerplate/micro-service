# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8

EXPOSE 5000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

WORKDIR /app

ADD sdk sdk
ADD src src

ADD .env .
ADD .flaskenv .

# Install pip requirements
ADD requirements requirements
ADD install_requirements.sh .
RUN ./install_requirements.sh

# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
RUN useradd appuser && chown -R appuser /app
USER appuser

# gunicorn --check-config APP_MODULE

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# docker-compose up will run this
CMD ["gunicorn", "--config", "src/config/gunicorn_conf.py", "src.app:app"]