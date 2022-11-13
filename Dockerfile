# import latest ubuntu image
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# pyenv dependencies & pip/git
RUN apt update && apt install -y python-pip git \
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# workdir
WORKDIR /app

# pyenv setup
ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# pyenv install
RUN curl https://pyenv.run | bash

RUN exec $SHELL

# install python 3.10.8
RUN pyenv install 3.10.8 \
    && pyenv global 3.10.8

# install poetry
RUN curl -sSL https://install.python-poetry.org | python -

# add '$HOME/.local/bin' to PATH
ENV PATH $HOME/.local/bin:$PATH

# copy project files to working directory
COPY ./ /app

# install app dependencies
RUN poetry install

# run the app
CMD ["poetry", "run", "python", "main.py"]
