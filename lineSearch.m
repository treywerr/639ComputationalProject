<<<<<<< HEAD
function alpha = lineSearch(x, s, f)
b=0.5;
syms x1 x2;
xc = x;
alpha = 1;
xt = xc-alpha*s;
xt = double(xt);
s = double(s);
ft = f(xt(1), xt(2));
fgoal = f(xc(1), xc(2))-(b*alpha*(s'*s));
k=1;
while(ft>=fgoal && k<10)
    k=k+1;
    alpha = b*alpha;
    xt = xc-(alpha*s);
    ft = f(xt(1), xt(2));
    fgoal = f(xc(1), xc(2))-(b*alpha*(s'*s));
end

end
    
    
||||||| 9b9c7ac
=======
function a = lineSearch(x, s, f)
t=1;
syms a;
feval = f(x + (a*s));
fprime = diff(feval, a);
a=1;
while(fprime(a)!=0)
    
>>>>>>> 6089e2aea8104bc1324349b5f06ea49cd9142aba
