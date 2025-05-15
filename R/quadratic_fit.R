# 観測データ
x <- c(1, 2, 3, 4)
y <- c(2, 3, 10, 15)

# 2次関数 y = ax^2 + bx + c にフィット
fit <- lm(y ~ x + I(x^2))

# 結果を表示
cat("Fitted model:\n")
cat(paste0("y = ",
           round(coef(fit)["I(x^2)"], 4), "x^2 + ",
           round(coef(fit)["x"], 4), "x + ",
           round(coef(fit)["(Intercept)"], 4), "\n"))
