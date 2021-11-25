function [x,hist] = Newton(f,x0,maxSteps)
    hist = zeros(2,maxSteps); % History. Contains the point generated at each step.
    x = x0';
    syms x1 x2; % Declare the symbols so Newton can work with f symbolically
    hess = hessian(f,[x1,x2]);
    grad = gradient(f,[x1,x2]);
    for k=1:maxSteps
        % Store x_k
        hist(1,k) = x(1);
        hist(2,k) = x(2);
        % Substitute x_k into the hessian and gradient functions
        A = subs(hess, [x1,x2], [x(1),x(2)]);
        B = subs(grad, [x1,x2], [x(1),x(2)]);
        % Newton Step
        s = linsolve(double(A), -1*double(B)); % Must convert from symbolic to double. Destroys computer otherwise.
        % Update solution
        x = x + s;
    end
end