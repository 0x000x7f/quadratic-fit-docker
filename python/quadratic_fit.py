import numpy as np

# 観測データ
x = np.array([1, 2, 3, 4])
y = np.array([2, 3, 10, 15])

# Vandermonde行列を使って2次関数の係数を最小二乗法で求める
X = np.vstack([x**2, x, np.ones_like(x)]).T

# 最小二乗解を計算
coeffs, residuals, rank, s = np.linalg.lstsq(X, y, rcond=None)

# 結果を表示
a, b, c = coeffs
print(f"f(x) = {a:.4f}x^2 + {b:.4f}x + {c:.4f}")
