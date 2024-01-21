FROM python

# Set the workdirectory
WORKDIR /usr/src/app

COPY . .

# install the dependencies (curl, poetry)
RUN apt=get -yqq update & \
    rm -rf /var/lib/apt/lists/* && \
    apt-get -yqq install --no-install-recommends curl && \
    pip3 install --upgrade pip && \
    curl -sSL https://install.python-poetry.org | POETRY_HOME=/etc/poetry python3 - && \
    cp /etc/poetry/bin/poetry /usr/local/bin && \
    poetry install

RUN chmod 755 run.sh
