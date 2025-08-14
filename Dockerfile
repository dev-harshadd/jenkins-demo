FROM python:3.11-slim

WORKDIR /jenkinsDemo.py

COPY jenkinsDemo.py .

CMD ["python", "jenkinsDemo.py"]
