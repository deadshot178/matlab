A = [1 0 0 0 0 0 0 0 0 0 0 0;
     1 2 4 8 0 0 0 0 0 0 0 0;
     0 0 0 0 1 0 0 0 0 0 0 0;
     0 0 0 0 1 4 16 64 0 0 0 0;
     0 0 0 0 0 0 0 0 1 0 0 0;
     0 0 0 0 0 0 0 0 1 5 25 125;
     0 1 4 12 0 -1 0 0 0 0 0 0;
     0 0 0 0 0 1 8 48 0 -1 0 0;
     0 0 2 12 0 0 -2 0 0 0 0 0;
     0 0 0 0 0 0 2 24 0 0 -2 0;
     0 0 1 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0  2 30];

b = [3;2;2;4;4;8;0;0;0;0;0;0];
coefficients = A \ b;

% To evaluate P(9), we use the third spline S_3 since 7 < 9 < 12.
% S_3(x) = a_3 + b_3(x - 7) + c_3(x - 7)^2 + d_3(x - 7)^3
a_3 = coefficients(9);
b_3 = coefficients(10);
c_3 = coefficients(11);
d_3 = coefficients(12);

P_9 = a_3 + b_3*(9 - 7) + c_3*(9 - 7)^2 + d_3*(9 - 7)^3;

% Display the result
fprintf('P(9) = %.5f\n', P_9);