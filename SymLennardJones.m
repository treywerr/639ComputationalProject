function [f,g] = SymLennardJones(n) % Number of dimesions
  syms x [(1 + 3*(n - 2)) 1];
  f(x) = 1/x(1)^12 - 2/x(1)^6;
  for j = 2:3:3*(n-3)+2
    f(x) = formula(f) + 1/(x(j)^2 + x(j+1)^2 + x(j+2)^2)^6 - 2/(x(j)^2 + x(j+1)^2 + x(j+2)^2)^3;
    f(x) = formula(f) + 1/(x(j)^2 + x(j+1)^2 + (x(j+2) - x(1))^2)^6 - 2/(x(j)^2 + x(j+1)^2 + (x(j+2) - x(1))^2)^3;
    for i = 2:3:j-1
      f(x) = formula(f) + 1/((x(j) - x(i))^2 + (x(j+1) - x(i+1))^2 + (x(j+2) - x(i+2))^2)^6 - 2/((x(j) - x(i))^2 + (x(j+1) - x(i+1))^2 + (x(j+2) - x(i+2))^2)^3;
    end
  end
  g(x) = gradient(f, x);
