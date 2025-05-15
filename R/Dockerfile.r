FROM r-base:latest

WORKDIR /app

COPY quadratic_fit.R .

CMD ["Rscript", "quadratic_fit.R"]
