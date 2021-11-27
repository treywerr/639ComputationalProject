<<<<<<< HEAD
function [x, hist] = NelderMead(f, x0, maxSteps)
hist = zeros(2,maxSteps);
x = x0';
size = length(x);
k=1;
%alpha > 1
while(tol || k<maxSteps)
    %xc =centroid - not sure how to do that right now
    xr = xc +  alpha(xc-x(size));
    if(f(xr)>f(x(1)))

||||||| 9b9c7ac
=======
function x = NelderMead(f, x0, maxSteps)

>>>>>>> 6089e2aea8104bc1324349b5f06ea49cd9142aba
