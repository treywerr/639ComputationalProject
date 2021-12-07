%% ---------- Function Declarations & 3D Plots -------------
figure("name", "3D Plots")

% Rosenbrock function
syms f1(x1,x2);
f1(x1,x2) = 100*(x2 - x1.^2).^2 + (x1 - 1).^2;
subplot(2,3,1);
fsurf(f1, [-5 10])
title("Rosenbrock Function");

% Three-hump camel function
syms f2(x1,x2);
f2(x1,x2) = 2*x1.^2 - 1.05*x1.^4 + x1.^6/6 + x1.*x2 + x2.^2;
subplot(2,3,2);
fsurf(f2, [-5 5])
title("Three-hump Camel Function");

% Michalewicz function
syms x1 x2 k;
f3(x1,x2) = -sin(x1).*sin(x1.^2/pi).^(2*k) - sin(x2).*sin(2*x2.^2/pi).^(2*k);
f3 = subs(f3, k, 2); % Use subs to set the k parameter. Here k=2.
subplot(2,3,3);
fsurf(f3, [0 pi])
title("Michalewicz Function");

% Ackley function
syms f4(x1,x2);
f4(x1,x2) = -20*exp(-0.2*sqrt((x1.^2 + x2.^2)/2)) - exp((cos(2*pi*x1) + cos(2*pi*x2))/2) + 20 + exp(1);
subplot(2,3,4);
fsurf(f4,[-32.768 32.768])
title("Ackley Function");

% Sixth Bukin function
syms f5(x1,x2);
f5(x1,x2) = 100*sqrt(abs(x2 - 0.01*x1.^2)) + 0.01*abs(x1+10);
subplot(2,3,5);
fsurf(f5,[-15 -5 -3 3])
title("Sixth Bukin Function");

% ------------- Contour Plots & Convergence Paths ---------------

%% Rosenbrock
figure("name", "Rosenbrock function")
x0 = [2 7];
% Critical points
Min = [1 1]';
% -Nelder-Mead-
[x,hist] = NelderMead(f1,x0,20);
subplot(2,3,1);
hold on;
fcontour(f1, [-5 10])
title("Nelder Mead Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
hold off;
% -Steepest descent-
[x,hist] = SteepestDescent(f1,x0,20);
subplot(2,3,2);
hold on;
fcontour(f1, [-5 10])
title("Steepest Descent Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
hold off;
% -Newton-
[x,hist] = Newton(f1,x0,20);
subplot(2,3,3);
hold on;
fcontour(f1, [-5 10])
title("Newton's Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*') % Plot convergence path as a solid black line and final point as an open blue asterisk.
plot(Min(1,:),Min(2,:),'r_')
hold off;
% -Quasi-Newton-
[x,hist] = QuasiNewton(x0, eye(2),f1,20);
subplot(2,3,4);
hold on;
fcontour(f1, [-5 10])
title("Quasi-Newton Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
hold off;
% -Conjugate gradient-
[x,hist] = ConjugateGradient(f1,x0,20);
subplot(2,3,5);
hold on;
fcontour(f1, [-5 10])
title("Conjugate Gradient Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
hold off;

%% Camel
figure("name", "Three-hump camel function")
x0 = [2 2];
Min = [-1.7476 0.8738; 0 0; 1.7476 -0.8738]';
% -Nelder-Mead-
[x,hist] = NelderMead(f2,x0,20);
subplot(2,3,1);
hold on;
fcontour(f2, [-5 5])
title("Nelder Mead Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
hold off;
% -Steepest Descent-
[x,hist] = SteepestDescent(f2,x0,20);
subplot(2,3,2);
hold on;
fcontour(f2, [-5 5])
title("Steepest Descent Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
hold off;
% -Newton-
[x,hist] = Newton(f2,x0,20);
subplot(2,3,3);
hold on;
fcontour(f2,[-5 5])
title("Newton's Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
hold off;
% -Quasi-Newton-
[x,hist] = QuasiNewton(x0,eye(2),f2,20);
subplot(2,3,4);
hold on;
fcontour(f2, [-5 5])
title("Quasi-Newton Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
hold off;
% -Conjugate gradient-
[x,hist] = ConjugateGradient(f2,x0,20);
subplot(2,3,5);
hold on;
fcontour(f2, [-5 5])
title("Conjugate Gradient Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
hold off;

%% Michalewicz
figure("name", "Michalewicz function")
Min = [2.1376 1.5708]';
Max = [0.3013 0.2953; 0.3013 2.2285; 0.4214 2.2262]';
Saddle = [0.3944 1.5708; 0.4214 1.5708; 2.1376 0.2953; 2.1376 2.2285]';
% -Nelder-Mead-
[x,hist] = NelderMead(f3,[2 2],20);
subplot(2,3,1);
hold on;
fcontour(f3, [0 pi])
title("Nelder Mead Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
plot(Max(1,:),Max(2,:),'g+')
plot(Saddle(1,:),Saddle(2,:),'bo')
hold off;
% -Steepest Descent-
[x,hist] = SteepestDescent(f3,[2 2],20);
subplot(2,3,2);
hold on;
fcontour(f3, [0 pi])
title("Steepest Descent Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
plot(Max(1,:),Max(2,:),'g+')
plot(Saddle(1,:),Saddle(2,:),'bo')
hold off;
% -Newton-
[x,hist] = Newton(f3,[2 2],20);
subplot(2,3,3);
hold on;
fcontour(f3,[0 pi])
title("Newton's Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
plot(Max(1,:),Max(2,:),'g+')
plot(Saddle(1,:),Saddle(2,:),'bo')
hold off;
% -Quasi-Newton-
[x,hist] = QuasiNewton([2 2],eye(2),f3,20);
subplot(2,3,4);
hold on;
fcontour(f3, [0 pi])
title("Quasi-Newton Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
plot(Max(1,:),Max(2,:),'g+')
plot(Saddle(1,:),Saddle(2,:),'bo')
hold off;
% -Conjugate gradient-
[x,hist] = ConjugateGradient(f3,[2 2],20);
subplot(2,3,5);
hold on;
fcontour(f3, [0 pi])
title("Conjugate Gradient Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Min(1,:),Min(2,:),'r_')
plot(Max(1,:),Max(2,:),'g+')
plot(Saddle(1,:),Saddle(2,:),'bo')
hold off;

%% Ackley
figure("name", "Ackley function")
Max = [-32.5020 -16.5010; -32.5020 16.5010; -32.5004 32.5004; -16.5101 -16.5101; -16.5101 16.5101; -16.5010 -32.5020; -16.5010 -32.5020; 16.5010 -32.5020; 16.5010 32.5020; 16.5101 -16.5101; 16.5101 16.5101; 32.5004 -32.5004; 32.5004 32.5004; 32.5020 -16.5010; 32.5020 16.5010]';
% -Nelder-Mead-
[x,hist] = NelderMead(f4,[7 7],20);
subplot(2,3,1);
hold on;
fcontour(f4, [-32.768 32.768])
title("Nelder Mead Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Max(1,:),Max(2,:),'g+')
hold off;
% -Steepest Descent-
[x,hist] = SteepestDescent(f4,[7 7],20);
subplot(2,3,2);
hold on;
fcontour(f4, [-32.768 32.768])
title("Steepest Descent Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Max(1,:),Max(2,:),'g+')
hold off;
% -Newton-
[x,hist] = Newton(f4,[7 7],20);
subplot(2,3,3);
hold on;
fcontour(f4,[-32.768 32.768])
title("Newton's Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Max(1,:),Max(2,:),'g+')
hold off;
% -Quasi-Newton-
[x,hist] = QuasiNewton([7 7],eye(2),f4,20);
subplot(2,3,4);
hold on;
fcontour(f4, [-32.768 32.768])
title("Quasi-Newton Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Max(1,:),Max(2,:),'g+')
hold off;
% -Conjugate gradient-
[x,hist] = ConjugateGradient(f4,[7 7],20);
subplot(2,3,5);
hold on;
fcontour(f4, [-32.768 32.768])
title("Conjugate Gradient Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
plot(Max(1,:),Max(2,:),'g+')
hold off;

%% Bukin
figure("name", "Sixth Bukin function")
x0 = [-10 -1];
% -Nelder-Mead-
[x,hist] = NelderMead(f5,x0,20);
subplot(2,3,1);
hold on;
fcontour(f5, [-15 -5 -3 3])
title("Nelder Mead Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
hold off;
% -Steepest Descent-
[x,hist] = SteepestDescent(f5,x0,20);
subplot(2,3,2);
hold on;
fcontour(f5,[-15 -5 -3 3])
title("Steepest Descent Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
hold off;
% -Newton-
[x,hist] = Newton(f5,x0,20);
subplot(2,3,3);
hold on;
fcontour(f5,[-15 -5 -3 3])
title("Newton's Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
hold off;
% -Quasi-Newton-
[x,hist] = QuasiNewton(x0,eye(2),f5,20);
subplot(2,3,4);
hold on;
fcontour(f5, [-15 -5 -3 3])
title("Quasi-Newton Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
hold off;
% -Conjugate gradient-
[x,hist] = ConjugateGradient(f5,x0,20);
subplot(2,3,5);
hold on;
fcontour(f5, [-15 -5 -3 3])
title("Conjugate Gradient Method");
plot(hist(1,:),hist(2,:),'k-', x(1),x(2),'b*')
hold off;