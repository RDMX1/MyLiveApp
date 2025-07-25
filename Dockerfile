FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential libssl-dev libffi-dev autoconf automake libtool pkg-config

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "backend.app:app"]
