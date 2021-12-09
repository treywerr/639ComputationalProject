function [min, hist] = QuasiNewton(x0, B0, f, maxSteps)
hist = NaN*ones(length(x0), maxSteps);
min = x0'; % initial guess
syms x [length(min), 1];
B = B0; %initial Hessian, usually I
grad = gradient(f, x);
for k=1:maxSteps
    
    % Store x_k
    hist(:,k) = min;
    %sub values into gradient
    ngrad = -1*double(subs(grad, x, min));
    % check for termination
    if (norm(ngrad) < 0.0001)
        return;
    end
    %compute quasi-Newton Step
    [s,r] = linsolve(B,ngrad);
    %update solution
    min = min + s;
    newgrad = double(subs(grad, x, min));
    y = newgrad + ngrad; 
    %update hessian approx
    B = B + ((y*y')/(y'*s)) - ((B*(s*s')*B)/(s'*B*s));
end
    


