FROM debian:stable-slim

RUN apt-get update

RUN apt install -y build-essential
RUN apt install -y cmake
RUN apt install -y doxygen
RUN apt install -y graphviz

RUN apt install -y clang
RUN apt install -y clang-format

RUN apt install -y git
RUN apt install -y clang-tidy
RUN apt install -y iwyu

RUN apt install -y python3
RUN apt install -y python3-pip
RUN apt install -y python3.11-venv

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements-python .

RUN python3 -m pip install --upgrade pip && \
    pip install -r requirements-python

RUN printf "\nalias ls='ls --color=auto'\n" >> ~/.bashrc
RUN printf "\nalias ll='ls -alF'\n" >> ~/.bashrc
