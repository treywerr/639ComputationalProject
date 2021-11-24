% ---------- Plotting -------------
% Rosenbrock
x1 = linspace(-5,10);
x2 = x1';
z = f1(x1, x2);
subplot(2,3,1);
surf(x1,x2,z)
% Camel
x1 = linspace(-5,5);
x2 = x1';
z = f2(x1,x2);
subplot(2,3,2);
surf(x1,x2,z)
% Michalewicz


%---------- Function Declarations -----------
% Rosenbrock Function
function [z] = f1(x1, x2)
    z = 100*(x2 - x1.^2).^2 + (x1 - 1).^2;
end

% Three-hump Camel Function
function [z] = f2(x1,x2)
    z = 2*x1.^2 - 1.05*x1.^4 + x1.^6/6 + x1.*x2 + x2.^2;
end

% Michalewicz Function
function [z] = f3(x)
    k = 2; % find better way to deal with this parameter?
    z = 0;
    for i=1:2
        z = z - sin(x(i))*sin(i*x(i)^2/pi)^(2*k);
    end
end

% Ackley Function
function [z] = f4(x)
    z = -20*exp(-0.2*sqrt((x(1)^2 + x(2)^2)/2)) - exp((cos(2*pi*x(1)) + cos(2*pi*x(2)))/2) + 20 + exp(1);
end

% Sixth Bukin Function
function [z] = f5(x)
    z = 100*sqrt(abs(x(2) - 0.01*x(1)^2)) + 0.01*abs(x(1)+10);
end