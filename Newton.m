function [min,hist] = Newton(f,initial,maxSteps)
    hist = NaN*ones(length(initial),maxSteps); % History. Contains the point generated at each step.
    syms x [length(initial), 1]; % Declare the symbols so Newton can work with f symbolically
    hess = hessian(f,x);
    grad = gradient(f,x);
    min = initial';
    for k=1:maxSteps
        % Store x_k
        hist(:,k) = min;
        % Substitute x_k into the hessian and gradient functions
        A = double(subs(hess, x, min));
        B = double(subs(grad, x, min));
        % check for termination
        if norm(B) < 0.0001
            return;
        end
        % Newton Step
        [s,r] = linsolve(A, -1*B); % Must convert from symbolic to double. Destroys computer otherwise.
        % Update solution
        min = min + s;
    end
end
