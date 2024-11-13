#FROM python:3.8-slim-buster
FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y build-essential libzstd-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
#RUN apt update -y && apt install awscli -y
#RUN apt install libzstd-dev
#RUN pip install pyzstd
WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --upgrade accelerate
RUN pip uninstall -y transformers accelerate
RUN pip install transformers accelerate

CMD ["python3", "app.py"]