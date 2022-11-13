# import python 3.10.8 image
FROM python:3.10.8

# workdir
WORKDIR /app

# pyenv install
RUN curl https://pyenv.run | bash

# install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# add '$HOME/.local/bin' to PATH
ENV PATH /.local/bin:$PATH

RUN exec $SHELL

# copy project files to working directory
COPY ./ /app

# install app dependencies
RUN poetry install

# run the app
CMD ["poetry", "run", "python3", "main.py"]
