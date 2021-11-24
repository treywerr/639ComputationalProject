function [x,hist] = Newton(f,x0,maxSteps)
    hist = zeros(2,maxSteps);
    x = x0';
    syms x1 x2;
    hess = hessian(f,[x1,x2]);
    grad = gradient(f,[x1,x2]);
    for k=1:maxSteps
        hist(1,k) = x(1);
        hist(2,k) = x(2);
        A = subs(hess, [x1,x2], [x(1),x(2)]);
        B = subs(grad, [x1,x2], [x(1),x(2)]);
        s = linsolve(double(A), double(B));
        x = x + s;
    end
end