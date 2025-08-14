FROM python:3.11-slim

WORKDIR /app

copy app.py .

CMD ["python", "app.py"]
