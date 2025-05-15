#include <iostream>
#include <vector>
#include <Eigen/Dense>

using namespace std;
using namespace Eigen;

Vector3d quadratic_fit(const vector<double>& x, const vector<double>& y) {
    int n = x.size();
    MatrixXd X(n, 3);
    VectorXd Y(n);

    for (int i = 0; i < n; ++i) {
        X(i, 0) = x[i] * x[i];
        X(i, 1) = x[i];
        X(i, 2) = 1.0;
        Y(i) = y[i];
    }

    Vector3d coeffs = (X.transpose() * X).ldlt().solve(X.transpose() * Y);
    return coeffs;
}

int main() {
    vector<double> x = {1, 2, 3, 4};
    vector<double> y = {2, 3, 10, 15};

    Vector3d coeffs = quadratic_fit(x, y);
    cout << "y = " << coeffs[0] << " x^2 + " << coeffs[1] << " x + " << coeffs[2] << endl;
    return 0;
}
