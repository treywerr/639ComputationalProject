%% Variable declarations
n = 5;
syms f(x1,x2) k;
f(x1,x2) = 100*(x2 - x1.^2).^2 + (x1 - 1).^2;
interval = [0 pi 0 pi];
X = linspace(interval(1),interval(2),n);
Y = linspace(interval(3),interval(4),n);
M = NaN*ones(2,n^2);
grad = gradient(f);
H = hessian(f,[x1,x2]);
%% Find critical points
for i=1:n
    for j=1:n
        M(:,(i-1)*n + j) = Newton([X(i) Y(j)]', grad, H, 0.0001);
    end
end
M = unique(M',"rows")'; % sorts M and eliminates duplicate critical points.
critcount = length(M);
%% Classify critical points
Min = NaN*ones(2,critcount);
Max = NaN*ones(2,critcount);
Saddle = NaN*ones(2,critcount);
Other = NaN*ones(2,critcount);
for i=1:critcount
    if ~isnan(M(:,i))
        A = double(subs(H, [x1,x2], [M(1,i),M(2,i)]));
        d = eig(A);
        tol = length(d)*eps(max(d));
        if all(d > tol)
            Min(:,i) = M(:,i);
        elseif all(d < -tol)
            Max(:,i) = M(:,i);
        elseif all(abs(d) < tol)
            Other(:,i) = M(:,i);
        else
            Saddle(:,i) = M(:,i);
        end
    end
end
Min
Max
Saddle
Other

%% plot critical points
figure("name", "Critical Points");
hold on;
fcontour(f, interval)
plot(Min(1,:),Min(2,:),'r_')
plot(Max(1,:),Max(2,:),'g+')
plot(Saddle(1,:),Saddle(2,:),'bo')
plot(Other(1,:),Other(2,:),'mx')
hold off;

%% Newton's method
function [x] = Newton(x, f, J, tol)
    syms x1 x2;
    for i=1:20
        A = subs(J, [x1,x2], [x(1),x(2)]);
        B = subs(f, [x1,x2], [x(1),x(2)]);
        [s,r] = linsolve(double(A),-1*double(B)); % output r only used to suppress ill-condiitoned warning
        x = x + s;
        if (abs(double(f(x(1),x(2)))) < tol*ones(2,1))
            return;
        end
    end
    x = [NaN NaN]';
end