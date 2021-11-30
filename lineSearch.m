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
    while(all(ft>=fgoal) && k<10)
        k=k+1;
        alpha = b*alpha;
        xt = xc-(alpha*s);
        ft = f(xt(1), xt(2));
        fgoal = f(xc(1), xc(2))-(b*alpha*(s'*s));
    end
end