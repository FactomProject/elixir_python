FROM elixir:1.5.2

MAINTAINER Juan Jose Comellas <juanjo@factom.com>

# Ansible and defaults
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive  \
    apt-get install --no-install-recommends -yq \
        build-essential \
        python-dev \
        python-setuptools \
        python-pip && \
    pip install --upgrade awscli \
        boto3 \
        --ignore-installed six && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Docker client
RUN curl -L -o /tmp/docker-18.06.0-ce.tgz https://download.docker.com/linux/static/stable/x86_64/docker-18.06.0-ce.tgz && \
        tar -xz -C /tmp -f /tmp/docker-18.06.0-ce.tgz && \
        mv /tmp/docker/* /usr/bin

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
