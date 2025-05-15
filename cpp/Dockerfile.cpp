FROM gcc:latest

WORKDIR /app

COPY quadratic_fit.cpp .

RUN apt-get update && apt-get install -y libeigen3-dev && rm -rf /var/lib/apt/lists/*

RUN g++ -std=c++17 -O2 -I/usr/include/eigen3 quadratic_fit.cpp -o quadfit

CMD ["./quadfit"]
