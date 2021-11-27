function x = SteepestDescent(f, x0, maxSteps)
hist = zeros(2,maxSteps); % History. Contains the point generated at each step.
x = x0';
syms x1 x2 a;
for k=1:maxSteps
    s = -(gradient(f,[x1,x2]));
    alpha = linesearch(x, s, f);
    x= x+(alpha*s);
end
end
