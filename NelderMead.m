function [min, hist] = NelderMead(f, min, maxSteps)
n = length(min);
hist = NaN*ones(n,maxSteps); % History. Contains the point generated at each step.
syms x [n, 1];
min = min';

% generate initial simplex
S = zeros(n,n+1); % simplex
S(:,1) = min;
for j=1:n
    if min(j) ~= 0
        h = 0.05; % both of these h are arbitrary. Need to experiment.
    else
        h = 0.00025;
    end
    e = zeros(n,1); % unit vector in jth component of x
    e(j) = 1;
    S(:,j+1) = min + h*e;
end

tol=0.001;
%set coefficients to standard values
alpha = 1;
gamma = 2;
rho = 0.5;
sigma = 0.5;
% while(abs(f(x(1,k),x(2,k))-(f(x(1,k+1), x(2,k+1)))) > tol && k<maxSteps)
for k=1:maxSteps
    hist(:,k) = S(:,1); % store current best guess
    
    % order simplex
    fevals = zeros(1,n+1); % determine function values at all simplex points
    for i=1:n+1
        fevals(i) = double(subs(f, x, S(:,i)));
    end

    for i=2:n+1 % begin insertion sort
        temp = S(:,i);
        j = i-1;
        while ( j >= 1 && fevals(j) > fevals(i) )
            S(:,j+1) = S(:,j);
            j = j-1;
        end
        S(:,j+1) = temp;
    end
    
    % check for termination
    min = S(:,1);
    f_x1 = double(subs(f, x, S(:,1)));
    if k > 1
        if abs(f_x1 - double(subs(f,x,hist(:,k-1)))) < tol
            return;
        end
    end
    
    x0 = mean(S(:,1:n),2); % centroid
    
    %reflection point
    xr = x0 + alpha*(x0-S(:,n+1));
    
    f_xr = double(subs(f, x, xr));
    f_xn = double(subs(f, x, S(:,n)));
    if(f_xr >= f_x1 && f_xr < f_xn)
        S(:,n+1)=xr;
        continue;
    elseif(f_xr < f_x1) %expansion
        xe = x0 + gamma*(xr-x0); %expanded point
        if(double(subs(f, x, xe)) < f_xr)
            S(:,n+1)=xe;
            continue;
        else
            S(:,n+1)=xr;
            continue;
        end
    else %contraction
        xc = x0 + rho*(S(:,n+1)-x0); %contracted point
        
        if(double(subs(f,x,xc)) < double(subs(f,x,S(:,n+1))))
            S(:,n+1)=xc;
            continue;
        else %shrink
            for i=2:n+1
                S(:,i) = S(:,1) + (sigma * (S(:,i)-S(:,1)));
            end
        end
    end
end