function alpha = lineSearch(init, s, f)
b=0.5;
t=0.25;
syms x [length(init), 1];
xc = init;
alpha = 1;
xt = xc+alpha*s;
ft = subs(f, x, xt);
grad = gradient(f, x);
g = double(subs(grad, x, xc));
fgoal = (subs(f, x, xc)) + (t*alpha*(g'*s));
k=1;
while(ft>=fgoal && k<20)
    k=k+1;
    alpha = b*alpha;
    xt = xc+(alpha*s);
    ft = double(subs(f, x, xt));
    fgoal = double(subs(f, x, xc))+(t*alpha*(g'*s));
end

end
