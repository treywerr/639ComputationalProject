%% Variable declarations
n = 5; % density of initial points.
tol = 0.01; % tolerance for deciding convergence.

%% ----------ROSENBROCK FUNCTION------------
syms f(x1,x2);
f(x1,x2) = 100*(x2 - x1.^2).^2 + (x1 - 1).^2;
interval = [-5 10 -5 10];
Min = [1 1]';

figure();
t = tiledlayout(2,3,'TileSpacing','compact');
X = linspace(interval(1),interval(2),n);
Y = linspace(interval(3),interval(4),n);
% Nelder-Mead
Mins = NaN*ones(2, n^2);
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = NelderMead(f,[X(i) Y(j)],20);
        if all( abs(out - Min(:,1)) < tol)
            Mins(:,(i-1)*n + j) = [X(i) Y(j)]';
        else
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
scatter(Mins(1,:),Mins(2,:),'r','filled','s')
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Nelder-Mead")
hold off;
% Steepest Descent
Mins = NaN*ones(2, n^2);
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = SteepestDescent(f,[X(i) Y(j)],20);
        if all( abs(out - Min(:,1)) < tol)
            Mins(:,(i-1)*n + j) = [X(i) Y(j)]';
        else
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
scatter(Mins(1,:),Mins(2,:),'r','filled','s')
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Steepest Descent")
hold off;
% Newton
Mins = NaN*ones(2, n^2);
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = Newton(f,[X(i) Y(j)],20);
        if all( abs(out - Min(:,1)) < tol)
            Mins(:,(i-1)*n + j) = [X(i) Y(j)]';
        else
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
scatter(Mins(1,:),Mins(2,:),'r','filled','s')
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Newton's Method")
hold off;
% Quasi-Newton
Mins = NaN*ones(2, n^2);
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = QuasiNewton([X(i) Y(j)],eye(2),f,20);
        if all( abs(out - Min(:,1)) < tol)
            Mins(:,(i-1)*n + j) = [X(i) Y(j)]';
        else
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
scatter(Mins(1,:),Mins(2,:),'r','filled','s')
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Quasi-Newton")
hold off;
% Conjugate Gradient
Mins = NaN*ones(2, n^2);
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = ConjugateGradient(f,[X(i) Y(j)],20);
        if all( abs(out - Min(:,1)) < tol)
            Mins(:,(i-1)*n + j) = [X(i) Y(j)]';
        else
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
scatter(Mins(1,:),Mins(2,:),'r','filled','s')
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Conjugate Gradient")
hold off;
str = string(Min(:,1));
str = "Min: [" + str(1) + "," + str(2) + "]";
lgd = legend({str,"Diverged"});
lgd.Layout.Tile = 6;




%% ----------------Three-hump camel function------------------
syms f(x1,x2);
f(x1,x2) = 2*x1.^2 - 1.05*x1.^4 + x1.^6/6 + x1.*x2 + x2.^2;
interval = [-5 5 -5 5];
Min = [-1.7476 0.8738; 0 0; 1.7476 -0.8738]';

figure();
t = tiledlayout(2,3,'TileSpacing','compact');
X = linspace(interval(1),interval(2),n);
Y = linspace(interval(3),interval(4),n);
% Nelder-Mead
Mins = NaN*ones(2, n^2, length(Min));
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = NelderMead(f,[X(i) Y(j)],20);
        set = 0;
        for k=1:length(Min)
            if all( abs(out - Min(:,k)) < tol)
                Mins(:,(i-1)*n + j,k) = [X(i) Y(j)]';
                set = 1;
                break;
            end
        end
        if ~set
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
colors = ['r' 'g' 'b'];
for i=1:3
    scatter(Mins(1,:,i),Mins(2,:,i),colors(i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Nelder-Mead")
hold off;
% Steepest Descent
Mins = NaN*ones(2, n^2, length(Min));
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = SteepestDescent(f,[X(i) Y(j)],20);
        set = 0;
        for k=1:length(Min)
            if all( abs(out - Min(:,k)) < tol)
                Mins(:,(i-1)*n + j,k) = [X(i) Y(j)]';
                set = 1;
                break;
            end
        end
        if ~set
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
colors = ['r' 'g' 'b'];
for i=1:3
    scatter(Mins(1,:,i),Mins(2,:,i),colors(i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Steepest Descent")
hold off;
% Newton
Mins = NaN*ones(2, n^2, length(Min));
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = Newton(f,[X(i) Y(j)],20);
        set = 0;
        for k=1:length(Min)
            if all( abs(out - Min(:,k)) < tol)
                Mins(:,(i-1)*n + j,k) = [X(i) Y(j)]';
                set = 1;
                break;
            end
        end
        if ~set
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
colors = ['r' 'g' 'b'];
for i=1:3
    scatter(Mins(1,:,i),Mins(2,:,i),colors(i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Newton's Method")
hold off;
% Quasi-Newton
Mins = NaN*ones(2, n^2, length(Min));
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = QuasiNewton([X(i) Y(j)],eye(2),f,20);
        set = 0;
        for k=1:length(Min)
            if all( abs(out - Min(:,k)) < tol)
                Mins(:,(i-1)*n + j,k) = [X(i) Y(j)]';
                set = 1;
                break;
            end
        end
        if ~set
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
colors = ['r' 'g' 'b'];
for i=1:3
    scatter(Mins(1,:,i),Mins(2,:,i),colors(i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Quasi-Newton")
hold off;
% Conjugate Gradient
Mins = NaN*ones(2, n^2, length(Min));
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        [out,hist] = ConjugateGradient(f,[X(i) Y(j)],20);
        set = 0;
        for k=1:length(Min)
            if all( abs(out - Min(:,k)) < tol)
                Mins(:,(i-1)*n + j,k) = [X(i) Y(j)]';
                set = 1;
                break;
            end
        end
        if ~set
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
nexttile
hold on;
colors = ['r' 'g' 'b'];
for i=1:3
    scatter(Mins(1,:,i),Mins(2,:,i),colors(i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Conjugate Gradient")
hold off;
% Legend
C{1,4} = [];
for i=1:3
    str = string(Min(:,i));
    str = "Min: [" + str(1) + "," + str(2) + "]";
    C(1,i) = {str};
end
C(1,4) = {"Diverged"};
lgd = legend(C);
lgd.Layout.Tile = 6;




%% ---------------Michalewicz function-----------------------
syms x1 x2 k;
f(x1,x2) = -sin(x1).*sin(x1.^2/pi).^(2*k) - sin(x2).*sin(2*x2.^2/pi).^(2*k);
f = subs(f, k, 2); % Use subs to set the k parameter. Here k=2.
interval = [0 pi 0 pi];
Min = [2.1376 1.5708]';
minsize = size(Min);
minsize = minsize(2);
Max = [0.3013 0.2953; 0.3013 2.2285; 0.4214 2.2262]';
maxsize = size(Max);
maxsize = maxsize(2);
Saddle = [0.3944 1.5708; 0.4214 1.5708; 2.1376 0.2953; 2.1376 2.2285]';
saddlesize = size(Saddle);
saddlesize = saddlesize(2);

figure();
t = tiledlayout(2,3,'TileSpacing','compact');
X = linspace(interval(1),interval(2),n);
Y = linspace(interval(3),interval(4),n);
%% Nelder-Mead
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,1,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Nelder-Mead")
hold off;
%% SteepestDescent
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,2,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Steepest Descent")
hold off;
%% Newton
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,3,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Newton's Method")
hold off;
%% Quasi-Newton
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,4,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Quasi-Newton")
hold off;
%% Conjugate Gradient
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,5,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Conjugate Gradient")
hold off;
%% Legend
C{1,1+minsize+maxsize+saddlesize} = [];
for i=1:minsize
    str = string(Min(:,i));
    str = "Min: [" + str(1) + "," + str(2) + "]";
    C(1,i) = {str};
end
for i=1:maxsize
    str = string(Max(:,i));
    str = "Max: [" + str(1) + "," + str(2) + "]";
    C(1,i+minsize) = {str};
end
for i=1:saddlesize
    str = string(Saddle(:,i));
    str = "Saddle: [" + str(1) + "," + str(2) + "]";
    C(1,i+minsize+maxsize) = {str};
end
C(1,1+minsize+maxsize+saddlesize) = {"Diverged"};
lgd = legend(C);
lgd.Layout.Tile = 6;




%% ---------------Ackley function--------------
syms f(x1,x2);
f(x1,x2) = -20*exp(-0.2*sqrt((x1.^2 + x2.^2)/2)) - exp((cos(2*pi*x1) + cos(2*pi*x2))/2) + 20 + exp(1);
interval = [-32.768 32.768 -32.768 32.768];
Min = [];
Max = [-32.5020 -16.5010; -32.5020 16.5010; -32.5004 32.5004; -16.5101 -16.5101; -16.5101 16.5101; -16.5010 -32.5020; -16.5010 -32.5020; 16.5010 -32.5020; 16.5010 32.5020; 16.5101 -16.5101; 16.5101 16.5101; 32.5004 -32.5004; 32.5004 32.5004; 32.5020 -16.5010; 32.5020 16.5010]';
Saddle = [];
minsize = size(Min);
minsize = minsize(2);
maxsize = size(Max);
maxsize = maxsize(2);
saddlesize = size(Saddle);
saddlesize = saddlesize(2);

figure();
t = tiledlayout(2,3,'TileSpacing','compact');
X = linspace(interval(1),interval(2),n);
Y = linspace(interval(3),interval(4),n);
X(3) = tol;
Y(3) = tol;
%% Nelder-Mead
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,1,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Nelder-Mead")
hold off;
%% SteepestDescent
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,2,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Steepest Descent")
hold off;
%% Newton
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,3,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Newton's Method")
hold off;
%% Quasi-Newton
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,4,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Quasi-Newton")
hold off;
%% Conjugate Gradient
[Mins,Maxs,Saddles,Divs] = RunConvergence(f,5,n,tol,X,Y,Min,Max,Saddle);
nexttile
hold on;
for i=1:(minsize)
    scatter(Mins(1,:,i),Mins(2,:,i),'filled','s')
end
for i=1:(maxsize)
    scatter(Maxs(1,:,i),Maxs(2,:,i),'filled','s')
end
for i=1:(saddlesize)
    scatter(Saddles(1,:,i),Saddles(2,:,i),'filled','s')
end
scatter(Divs(1,:),Divs(2,:),'k','filled','s')
title("Conjugate Gradient")
hold off;
% Legend
C{1,1+minsize+maxsize+saddlesize} = [];
for i=1:minsize
    str = string(Min(:,i));
    str = "Min: [" + str(1) + "," + str(2) + "]";
    C(1,i) = {str};
end
for i=(minsize+1):maxsize
    str = string(Max(:,i));
    str = "Max: [" + str(1) + "," + str(2) + "]";
    C(1,i) = {str};
end
for i=(minsize+maxsize+1):saddlesize
    str = string(Saddle(:,i));
    str = "Saddle: [" + str(1) + "," + str(2) + "]";
    C(1,i) = {str};
end
C(1,1+minsize+maxsize+saddlesize) = {"Diverged"};
lgd = legend(C);
lgd.Layout.Tile = 6;


%%
function [Mins,Maxs,Saddles,Divs] = RunConvergence(f, algo, n, tol, X, Y, Min, Max, Saddle)
minsize = size(Min);
minsize = minsize(2);
maxsize = size(Max);
maxsize = maxsize(2);
saddlesize = size(Saddle);
saddlesize = saddlesize(2);
Mins = NaN*ones(2, n^2, minsize);
Maxs = NaN*ones(2, n^2, maxsize);
Saddles = NaN*ones(2, n^2, saddlesize);
Divs = NaN*ones(2, n^2);
for i=1:n
    for j=1:n
        switch algo
            case 1
                [out,hist] = NelderMead(f,[X(i) Y(j)],20);
            case 2
                [out,hist] = SteepestDescent(f,[X(i) Y(j)],20);
            case 3
                [out,hist] = Newton(f,[X(i) Y(j)],20);
            case 4
                [out,hist] = QuasiNewton([X(i) Y(j)],eye(2),f,20);
            case 5
                [out,hist] = ConjugateGradient(f,[X(i) Y(j)],20)
        end
        set = 0;
        for k=1:minsize
            if all( abs(out - Min(:,k)) < tol)
                Mins(:,(i-1)*n + j,k) = [X(i) Y(j)]';
                set = 1;
                break;
            end
        end
        if ~set
            for k=1:maxsize
                if all( abs(out - Max(:,k)) < tol)
                    Maxs(:,(i-1)*n + j,k) = [X(i) Y(j)]';
                    set = 1;
                    break;
                end
            end
        end
        if ~set
            for k=1:saddlesize
                if all( abs(out - Saddle(:,k)) < tol)
                    Saddles(:,(i-1)*n + j,k) = [X(i) Y(j)]';
                    set = 1;
                    break;
                end
            end
        end
        if ~set
            Divs(:,(i-1)*n + j) = [X(i) Y(j)]';
        end
    end
end
end