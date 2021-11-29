function [min,hist] = Newton(f,initial,maxSteps)
    hist = zeros(length(initial),maxSteps); % History. Contains the point generated at each step.
    syms x [length(initial), 1]; % Declare the symbols so Newton can work with f symbolically
    hess = hessian(f,x);
    grad = gradient(f,x);
    min = initial';
    for k=1:maxSteps
        % Store x_k
        for i=1:length(initial)
            hist(i,k) = min(i);
        end
        % Substitute x_k into the hessian and gradient functions
        A = subs(hess, x, min);
        B = subs(grad, x, min);
        % Newton Step
        s = linsolve(double(A), -1*double(B)); % Must convert from symbolic to double. Destroys computer otherwise.
        % Update solution
        min = min + s;
    end
end
