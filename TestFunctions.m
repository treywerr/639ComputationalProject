%% ---------- Function Declarations & 3D Plots -------------
figure("name", "3D Plots")

% Rosenbrock function
syms f1(x1,x2);
f1(x1,x2) = 100*(x2 - x1.^2).^2 + (x1 - 1).^2;
subplot(2,3,1);
fsurf(f1, [-5 10])

% Three-hump camel function
syms f2(x1,x2);
f2(x1,x2) = 2*x1.^2 - 1.05*x1.^4 + x1.^6/6 + x1.*x2 + x2.^2;
subplot(2,3,2);
fsurf(f2, [-5 5])

% Michalewicz function
syms x1 x2 k;
f3(x1,x2) = -sin(x1).*sin(x1.^2/pi).^(2*k) - sin(x2).*sin(2*x2.^2/pi).^(2*k);
f3 = subs(f3, k, 2); % Use subs to set the k parameter. Here k=2.
subplot(2,3,3);
fsurf(f3, [0 pi])

% Ackley function
syms f4(x1,x2);
f4(x1,x2) = -20*exp(-0.2*sqrt((x1.^2 + x2.^2)/2)) - exp((cos(2*pi*x1) + cos(2*pi*x2))/2) + 20 + exp(1);
subplot(2,3,4);
fsurf(f4,[-32.768 32.768])

% Sixth Bukin function
syms f5(x1,x2);
f5(x1,x2) = 100*sqrt(abs(x2 - 0.01*x1.^2)) + 0.01*abs(x1+10);
subplot(2,3,5);
fsurf(f5,[-15 -5 -3 3])

% ------------- Contour Plots & Convergence Paths ---------------

%% Rosenbrock
figure("name", "Rosenbrock function")
[x,hist] = Newton(f1,[1.5 1],20);
subplot(2,3,1);
hold on;
fcontour(f1, [-5 10])
% Plot convergence path as a solid black line and final point as an open
% blue circle.
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'bo')
hold off;

%% Camel
figure("name", "Three-hump camel function")
[x,hist] = Newton(f2,[2 2],20);
subplot(2,3,1);
hold on;
fcontour(f2,[-5 5])
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'bo')
hold off;

%% Michalewicz
figure("name", "Michalewicz function")
[x,hist] = Newton(f3,[2 2],20);
subplot(2,3,1);
hold on;
fcontour(f3,[0 pi])
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'bo')
hold off;

%% Ackley
figure("name", "Ackley function")
[x,hist] = Newton(f4,[7 7],20);
subplot(2,3,1);
hold on;
fcontour(f4,[-32.768 32.768])
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'bo')
hold off;

%% Bukin
figure("name", "Sixth Bukin function")
[x,hist] = Newton(f5,[-14 -2],20);
% Currently has issue where hessian becomes singular. Likely due to absolute value in function.
subplot(2,3,1);
hold on;
fcontour(f5,[-15 -5 -3 3])
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'bo')
hold off;