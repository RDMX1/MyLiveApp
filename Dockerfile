FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential libssl-dev libffi-dev autoconf automake libtool pkg-config

# Set working directory to the repo root where Dockerfile and backend/ exist
WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy everything including backend/
COPY . .

# Expose the port Render expects
EXPOSE 8080

# Launch gunicorn with the correct app path
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "backend.app:app"]
