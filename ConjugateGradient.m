function [min, hist] = ConjugateGradient(f, init, maxStep)
  min = init';
  syms x [length(init), 1];
  hist = NaN*ones(length(init), maxStep);
  grad = gradient(f, x);
  g = double(subs(grad, x, min));
  s = -g;
  for k = 1:maxStep
    hist(:,k) = min;
    % check for termination
    if norm(g) < 0.0001
        return;
    end
    alpha = lineSearch(min, s, f);
    min = min + s.*alpha;
    g1 = double(subs(grad, x, min));
    beta = (g1'*g1)/(g'*g);
    g = g1;
    s = -g + beta*s;
  end

