FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    gfortran \
    build-essential \
    && pip install --no-cache-dir numpy

WORKDIR /app

COPY quadratic_fit.f90 .
COPY main.py .

RUN python -m numpy.f2py -c quadratic_fit.f90 -m quadfit

CMD ["python", "main.py"]
