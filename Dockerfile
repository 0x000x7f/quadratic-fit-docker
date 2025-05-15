FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    git \
    gfortran \
    build-essential \
    && pip install --no-cache-dir numpy

WORKDIR /app

# GitHubからclone（この行だけが変更点）
RUN git clone https://github.com/0x000x7f/quadratic-fit-docker.git .

# f2pyでFortranコードをPythonモジュール化
RUN python -m numpy.f2py -c quadratic_fit.f90 -m quadfit

CMD ["python", "main.py"]
