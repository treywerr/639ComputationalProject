%% Variable declarations
n = 5; % density of initial points.

%% Rosenbrock function
syms f1(x1,x2);
f1(x1,x2) = 100*(x2 - x1.^2).^2 + (x1 - 1).^2;
interval = [-5 10 -5 10];
X = linspace(interval(1),interval(2),n);
Y = linspace(interval(3),interval(4),n);
Min = [1 1]';

% Nelder-Mead
Mins = NaN*ones(2, n^2);
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        
    end
end

%% Three-hump camel function
syms f2(x1,x2);
f2(x1,x2) = 2*x1.^2 - 1.05*x1.^4 + x1.^6/6 + x1.*x2 + x2.^2;

% Michalewicz function
syms x1 x2 k;
f3(x1,x2) = -sin(x1).*sin(x1.^2/pi).^(2*k) - sin(x2).*sin(2*x2.^2/pi).^(2*k);
f3 = subs(f3, k, 2); % Use subs to set the k parameter. Here k=2.

% Ackley function
syms f4(x1,x2);
f4(x1,x2) = -20*exp(-0.2*sqrt((x1.^2 + x2.^2)/2)) - exp((cos(2*pi*x1) + cos(2*pi*x2))/2) + 20 + exp(1);

% Sixth Bukin function
syms f5(x1,x2);
f5(x1,x2) = 100*sqrt(abs(x2 - 0.01*x1.^2)) + 0.01*abs(x1+10);
