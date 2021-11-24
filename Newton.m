function [x,hist] = Newton(f,x0,maxSteps)
    hist = zeros(maxSteps);
    x = x0;
    for k=1:maxSteps
        s = linsolve( hessian(f(x(1),x(2)), gradient(f(x(1),x(2)))));
    end
end

