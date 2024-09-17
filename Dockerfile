FROM python:3.10.1

RUN apt-get update \
    && apt-get --assume-yes --no-install-recommends install \
        build-essential \
        curl \
        git \
        jq \
        libgomp1 \
        vim

WORKDIR /app

# Create a virtual environment in the /app directory
RUN python -m venv /app/venv

# upgrade pip version
RUN /app/venv/bin/python -m pip install --upgrade pip

RUN /app/venv/bin/python -m pip install rasa==3.6.2

ADD config.yml config.yml
ADD domain.yml domain.yml
ADD credentials.yml credentials.yml
ADD endpoints.yml endpoints.yml