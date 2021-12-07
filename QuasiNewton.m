function [x, hist] = QuasiNewton(x0, B0, f, maxSteps)
hist = NaN*ones(2, maxSteps);
x = x0'; % initial guess
syms x1 x2;
B = B0; %initial Hessian, usually I
grad = gradient(f, [x1, x2]);
for k=1:maxSteps
    
    % Store x_k
    hist(:,k) = x;
    %sub values into gradient
    ngrad = -1*double(subs(grad, [x1, x2], [x(1), x(2)]));
    % check for termination
    if (norm(ngrad) < 0.0001)
        return;
    end
    %compute quasi-Newton Step
    [s,r] = linsolve(B,ngrad);
    %update solution
    x = x + s;
    newgrad = double(subs(grad, [x1, x2], [x(1), x(2)]));
    y = newgrad + ngrad; 
    %update hessian approx
    B = B + ((y*y')/(y'*s)) - ((B*(s*s')*B)/(s'*B*s));
end
    


