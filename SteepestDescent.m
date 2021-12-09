function [min, hist] = SteepestDescent(f, x0, maxSteps)
hist = NaN*ones(length(x0),maxSteps);
min = x0';
syms x [length(min), 1];
%calculate base negative gradient
Ngrad = -(gradient(f,x));
for k=1:maxSteps
    %update history so we can plot it
    hist(:,k) = min;
    %sub correct x values into negative gradient
    s = double(subs(Ngrad, x, min));
    %check for termination
     if norm(s) < 0.0001
            return;
     end
    %find alpha to minimize f
    alpha = lineSearch(min, s, f);
    %update solution
    min= min+(alpha*s);
end
end
