function a = lineSearch(x, s, f)
t=1;
syms a;
feval = f(x + (a*s));
fprime = diff(feval, a);
a=1;
while(fprime(a)!=0)
    