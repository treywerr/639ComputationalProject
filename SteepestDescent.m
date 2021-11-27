<<<<<<< HEAD
function [x, hist] = SteepestDescent(f, x0, maxSteps)
hist = zeros(2,maxSteps);
x = x0';

syms x1 x2 a;
%calculate base negative gradient
Ngrad = -(gradient(f,[x1,x2]));
for k=1:maxSteps
    k
    %update history so we can plot it
    hist(1,k) = x(1);
    hist(2,k) = x(2);
    %sub correct x values into negative gradient
    s = subs(Ngrad, [x1, x2], [x(1),x(2)]);
    %find alpha to minimize f
    alpha = lineSearch(x, s, f);
    %update solution
    x= x+(alpha*s);
    x= double(x);
end
end
||||||| 9b9c7ac
=======
function x = SteepestDescent(f, x0, maxSteps)
hist = zeros(2,maxSteps); % History. Contains the point generated at each step.
x = x0';
syms x1 x2 a;
for k=1:maxSteps
    s = -(gradient(f,[x1,x2]));
    alpha = linesearch(x, s, f);
    x= x+(alpha*s);
end
end
>>>>>>> 6089e2aea8104bc1324349b5f06ea49cd9142aba
