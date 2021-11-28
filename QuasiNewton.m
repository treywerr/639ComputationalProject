function [x, hist] = QuasiNewton(x0, B0, f, maxSteps)
hist = zeros(2, maxSteps);
x = x0'; % initial guess
x = double(x);
syms x1 x2;
B = B0; %initial Hessian, usually I
for k=1:maxSteps
    % Store x_k
    hist(1,k) = x(1);
    hist(2,k) = x(2);
    %compute gradient and sub values in
    ngrad = -gradient(f, [x1, x2]);
    ngrad = subs(ngrad, [x1, x2], [x(1), x(2)]);
    %compute quasi-Newton Step
    s = B\ngrad;
    %update solution
    x = x + s;
    x = double(x);
    newgrad = gradient(f, [x1, x2]);
    newgrad = subs(newgrad, [x1, x2], [x(1), x(2)]);
    y = newgrad + ngrad; 
    %update hessian approx
    B = B + ((y*y')/(y'*s)) - ((B*s*s'*B)/(s'*B*s));
end
    


