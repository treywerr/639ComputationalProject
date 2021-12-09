init5 = [1 1 .5 1 .5 1 .5 1 0 .5];
[f,g] = SymLennardJones(5);
[min, hist] = NelderMead(@(x) LennardJones(VtoM(x)), init5, 300);
%LennardJones(VtoM(min)); -9.1037
figure('name', 'Minimum Energy Lennard-Jones cluster');
min = VtoM(min);
plot3(min(:,1), min(:,2), min(:,3), 'o');
title('Lennard-Jones cluster (n=5)');
hold on;
for j = 2:length(min)
    for i = 1:j-1
        plot3([min(i,1) min(j,1)], [min(i,2) min(j,2)], [min(i,3) min(j,3)]);
    end
end
grid on
%h = double(subs(hessian(f, argnames(f)), argnames(f), init5);
%double(subs(f, argnames(f), QuasiNewton(init5, h, f, 300)')); %-4
%double(subs(f, argnames(f), SteepestDescent(f, init5, 300)')); %-9.1039
%double(subs(f, argnames(f), ConjugateGradient(f, init5, 300)')); %-9.1039
%fminunc(@(x) double(subs(f, argnames(f), x)), init5);
%fminunc(@(x) double(subs(SymLennardJones(5), argnames(f), x)), init5)

