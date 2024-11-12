FROM python:3.8-slim-buster

#RUN apt update -y && apt install awscli -y
RUN apt-get update && apt-get install -y libpq-dev && rm -rf /var/lib/apt/lists/*
WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --upgrade accelerate
RUN pip uninstall -y transformers accelerate
RUN pip install transformers accelerate

CMD ["python3", "app.py"]