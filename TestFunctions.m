% ---------- Plotting -------------
% Rosenbrock
syms f1(x1,x2);
f1(x1,x2) = 100*(x2 - x1.^2).^2 + (x1 - 1).^2;
subplot(2,3,1);
fsurf(f1, [-5 10])
[x,hist] = Newton(f1,[1.5 1],15);
hold on; % Comment this out if you want to see the rosenbrock on its own.
fcontour(f1, [-5 10])
plot(hist(1,:),hist(2,:),'-.')
plot(x(1),x(2),'o')
hold off;

% Camel
syms f2(x1,x2);
f2(x1,x2) = 2*x1.^2 - 1.05*x1.^4 + x1.^6/6 + x1.*x2 + x2.^2;
subplot(2,3,2);
fsurf(f2, [-5 5])

% Michalewicz
syms x1 x2 k;
f3(x1,x2) = -sin(x1).*sin(x1.^2/pi).^(2*k) - sin(x2).*sin(2*x2.^2/pi).^(2*k);
subplot(2,3,3);
fsurf(subs(f3, k, 2), [0 pi])
Newton(subs(f3,k,2),[1.5 1],2)

% Ackley
syms f4(x1,x2);
f4(x1,x2) = -20*exp(-0.2*sqrt((x1.^2 + x2.^2)/2)) - exp((cos(2*pi*x1) + cos(2*pi*x2))/2) + 20 + exp(1);
subplot(2,3,4);
fsurf(f4,[-32.768 32.768])

% Sixth Bukin Function
syms f5(x1,x2);
f5(x1,x2) = 100*sqrt(abs(x2 - 0.01*x1.^2)) + 0.01*abs(x1+10);
subplot(2,3,5);
fsurf(f5,[-15 -5 -3 3])

