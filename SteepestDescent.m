
function [x, hist] = SteepestDescent(f, x0, maxSteps)
hist = zeros(2,maxSteps);
x = x0';

syms x1 x2;
%calculate base negative gradient
Ngrad = -(gradient(f,[x1,x2]));
for k=1:maxSteps
    %update history so we can plot it
    hist(:,k) = x;
    %sub correct x values into negative gradient
    s = double(subs(Ngrad, [x1, x2], [x(1),x(2)]));
    %find alpha to minimize f
    alpha = lineSearch(x, s, f);
    %update solution
    x= x+(alpha*s);
end
end
