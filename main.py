import numpy as np
import quadfit

x = np.array([1.0, 2.0, 3.0, 4.0], dtype=np.float64)
y = np.array([2.0, 3.0, 10.0, 15.0], dtype=np.float64)
n = len(x)

coeffs = np.zeros(3, dtype=np.float64)
quadfit.quadratic_fit(x, y, n, coeffs)

a, b, c = coeffs
print(f"f(x) = {a:.4f}x^2 + {b:.4f}x + {c:.4f}")
