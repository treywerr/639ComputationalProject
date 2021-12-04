function alpha = lineSearch(x, s, f)
b=0.9;
t=0.4;
syms x1 x2;
xc = x;
alpha = 1;
xt = xc+alpha*s;
xt = double(xt);
s = double(s);
ft = f(xt(1),xt(2));
grad(x1, x2) = gradient(f, [x1 x2]);
g = double(grad(xc(1), xc(2)));
fgoal = f(xc(1), xc(2))+(t*alpha*(g'*s));
k=1;
while(ft>=fgoal && k<20)
    k=k+1;
    alpha = b*alpha;
    xt = xc+(alpha*s);
    ft = double(f(xt(1), xt(2)));
    fgoal = double(f(xc(1), xc(2)))+(t*alpha*(g'*s));
end

end
