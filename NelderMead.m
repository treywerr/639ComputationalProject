function [x, hist] = NelderMead(f, x0, maxSteps)
hist = zeros(2,maxSteps);
x = x0';
x=double(x);
size = length(x);
n=size-1;
sum = 0;
k=1;
tol=0.001;
%set coefficients to standard values
alpha = 1;
gamma = 2;
rho = 0.5;
sigma = 0.5;
while(abs(f(x(k))-(f(x(k+1)))) > tol && k<maxSteps)
    for j=1:n+1
        sum = sum + x(j);
    end
    xc = sum/(n+1); % centroid
    %reflection point
    xr = xc + alpha(xc-x(n+1)); 
    if(f(xr)>=f(x(1))&& f(xr)<f(x(n)))
        x(n+1)=xr;
    %expansion
    elseif(f(xr)<f(x(1)))
        xe = xc + gamma*(xr-xc); %expanded point
        if(f(xe)<f(xr))
            x(n+1)=xe;
        else
            x(n+1)=xr;
        end
    else
        %contraction
        xcont = xc + rho*(x(n+1)-xc); %contracted point
        if(f(xcont)<f(x(n+1)))
            x(n+1)=xcont;
        %else - shrink
        else
            for i=2:n+1
                x(i) = x(1)-(sigma*(x(i)-x(1)));
            end
        end
    end
end

    
    

