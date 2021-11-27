function [x, hist] = NelderMead(f, x0, maxSteps)
hist = zeros(2,maxSteps);
x = x0';
size = length(x);
k=1;
%set coefficients to standard values
alpha = 1;
gamma = 2;
rho = 0.5;
sigma = 0.5;
while(norm < tol && k<maxSteps)
    %xc =centroid - not sure how to do that right now
    %reflection point
    xr = xc +  alpha(xc-x(size)); 
    if(f(xr)>=f(x(1))&& f(xr)<f(x(size-1)))
        x(size)=xr;
    %expansion
    elseif(f(xr)<f(x(1)))
        xe = xc + gamma*(xr-xc); %expanded point
        if(f(xe)<f(xr))
            x(size)=xe;
        else
            x(size)=xr;
        end
    else
        %contraction
        xcont = xc + rho*(x(size)-xc); %contracted point
        if(f(xcont)<f(x(size)))
            x(size)=xcont;
        end
        %else - shrink
    end

    
    end

    
    



