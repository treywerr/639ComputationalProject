%% Variable declarations
n = 5;
syms f(x1,x2) k;
% f(x1,x2) = 2*x1.^2 - 1.05*x1.^4 + x1.^6/6 + x1.*x2 + x2.^2;
% f(x1,x2) = 100*(x2 - x1.^2).^2 + (x1 - 1).^2;
% f(x1,x2) = -20*exp(-0.2*sqrt((x1.^2 + x2.^2)/2)) - exp((cos(2*pi*x1) + cos(2*pi*x2))/2) + 20 + exp(1);
% f(x1,x2) = -sin(x1).*sin(x1.^2/pi).^(2*k) - sin(x2).*sin(2*x2.^2/pi).^(2*k);
% f = subs(f,k,2);
% f(x1,x2) = 100*sqrt(sqrt((x2 - 0.01*x1.^2)^2)) + 0.01*sqrt((x1+10)^2);
f(x1,x2) = 100*sqrt(abs(x2 - 0.01*x1.^2)) + 0.01*abs(x1+10);
interval = [-15 -5 -3 3];
X = linspace(interval(1),interval(2),n);
Y = linspace(interval(3),interval(4),n);
M = NaN*ones(2,n^2);
grad = gradient(f);
H = hessian(f,[x1,x2]);
%% Find critical points
for i=1:n
    for j=1:n
        M(:,(i-1)*n + j) = Newton([X(i) Y(j)]', grad, H, 0.0001);
%         M(:,(i-1)*n + j) = Broyden([X(i) Y(j)]', grad, eye(2), 0.0001);
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
%% Broyden's Method
function [x] = Broyden(x, f, B0, tol)
    syms x1 x2;
    B = double(subs(B0, [x1,x2], [x(1),x(2)]));
    for i=1:20
        F = double(subs(f, [x1,x2], [x(1),x(2)]));
        [s,r] = linsolve(B, -1*F); % Newton-like step
        x = x + s; % Update solution
        if (abs(double(f(x(1),x(2)))) < tol*ones(2,1))
            return;
        end
        y = double( subs(f, [x1,x2], [x(1),x(2)]) ) - F;
        B = B + ( (y - B*s) * s') / (s'*s); % Update approx Jacobian
    end
%     x = [NaN NaN]';
end