%% Variable declarations
n = 10;
% X = linspace(-32.768,32.768,n);
% Y = linspace(-32.768,32.768,n);
X = linspace(0,pi,n);
Y = linspace(0,pi,n);
M = NaN*ones(2,n^2);
syms f(x1,x2) k;
f(x1,x2) = -sin(x1).*sin(x1.^2/pi).^(2*k) - sin(x2).*sin(2*x2.^2/pi).^(2*k);
f = subs(f,k,2);
% f(x1,x2) = -20*exp(-0.2*sqrt((x1.^2 + x2.^2)/2)) - exp((cos(2*pi*x1) + cos(2*pi*x2))/2) + 20 + exp(1);
grad = gradient(f);
H = hessian(f,[x1,x2]);
critcount = 0;
%% Find critical points
for i=1:n
    for j=1:n
        M(:,(i-1)*10 + j) = Newton([X(i) Y(j)]', grad, H, 0.0001);
        if ~isnan(M(:,(i-1)*10 + j))
            critcount = critcount+1;
        end
    end
end
M = unique(M',"rows")' % sorts M and eliminates duplicate critical points.
%% Classify critical points
Min = NaN*ones(2,critcount);
Max = NaN*ones(2,critcount);
Saddle = NaN*ones(2,critcount);
Other = NaN*ones(2,critcount);
for i=1:critcount
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

%% plot critical points
hold on;
% fcontour(f, [-32.768 32.768])
fcontour(f, [0 pi])
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