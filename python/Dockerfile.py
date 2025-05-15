FROM python:3.11-slim

WORKDIR /app

COPY quadratic_fit.py .

RUN pip install --no-cache-dir numpy

CMD ["python", "quadratic_fit.py"]
