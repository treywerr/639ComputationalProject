function [x, hist] = NelderMead(f, x0, maxSteps)
hist = zeros(length(x0),maxSteps)'; % History. Contains the point generated at each step.
%syms x [length(initial), 1];
x = x0';% need NM to work in N dimensions, f(x) needs to be f(x1, x2)
x=double(x);
size = length(x);
n=size-1;
sum = zeros(2,1);
k=1;
tol=0.001;
%set coefficients to standard values
alpha = 1;
gamma = 2;
rho = 0.5;
sigma = 0.5;
while(abs(f(x(1,k),x(2,k))-(f(x(1,k+1), x(2,k+1)))) > tol && k<maxSteps)
    k=k+1;
    for j=1:n+1
        sum = sum + x(j);
    end
    xc = sum/(n+1); % centroid - how do we do this for a vector?
    %reflection point
    xr = xc + alpha(xc-x(:,n+1)); 
    if(f(xr(1), xr(2))>=f(x(1,1), x(1,2))&& f(xr(1), xr(2))<f(x(1,n),x(2,n)))
        x(:,n+1)=xr;
    %expansion
    elseif(f(xr(1), xr(2))<f(x(1,1), x(2,1)))
        xe = xc + gamma*(xr-xc); %expanded point
        if(f(xe(1), xe(2))<f(xr(1), xr(2)))
            x(:,n+1)=xe;
        else
            x(:,n+1)=xr;
        end
    else
        %contraction
        xcont = xc + rho*(x(:,n+1)-xc); %contracted point
        if(f(xcont(1), xcont(2))<f(x(1,n+1),x(2, n+1)))
            x(:,n+1)=xcont;
        %else - shrink
        else
            for i=2:n+1
                x(:,i) = x(1)-(sigma*(x(:,i)-x(:,1)));
            end
        end
    end
end

    
    

