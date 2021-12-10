init6 = [1 .75 .5 1.25 1.25 1 .5 1 0 .5 .25 .8 .5];
[f, g] = SymLennardJones(6);
[min3, hist] = NelderMead(@(x) LennardJones(VtoM(x)), init6, 500);
%LennardJones(VtoM(min)); -12.3209
figure('name', 'Minimum Energy Lennard-Jones cluster');
min3 = VtoM(min3);
plot3(min3(:,1), min3(:,2), min3(:,3), 'o');
title('Lennard-Jones cluster (n=6)');
hold on;
for j = 2:length(min3)
    for i = 1:j-1
        plot3([min3(i,1) min3(j,1)], [min3(i,2) min3(j,2)], [min3(i,3) min3(j,3)]);
    end
end
grid on
%h = double(subs(hessian(f, argnames(f)), argnames(f), init6);
%double(subs(f, argnames(f), QuasiNewton(init6, h, f, 300)')); 
%double(subs(f, argnames(f), SteepestDescent(f, init6, 300)')); 
%double(subs(f, argnames(f), ConjugateGradient(f, init6, 300)')); 

init9 = [1 1 1 1 .5 1 0 1 .5 .5 0 1 .5 1 1 0 -.5 .75 .5 .5 1 1];
[f, g] = SymLennardJones(9);
[min2, hist] = NelderMead(@(x) LennardJones(VtoM(x)), init9, 500);
%LennardJones(VtoM(min)); -21.9549 
figure('name', 'Minimum Energy Lennard-Jones cluster');
min2 = VtoM(min2);
plot3(min2(:,1), min2(:,2), min2(:,3), 'o');
title('Lennard-Jones cluster (n=9)');
hold on;
for j = 2:length(min2)
    for i = 1:j-1
        plot3([min2(i,1) min2(j,1)], [min2(i,2) min2(j,2)], [min2(i,3) min2(j,3)]);
    end
end
grid on

init10 = [1 1.4 .8 1 .42 .9 0 0.85 .15 .5 0 1.6 .5 1.4 .8 0 1 1.5 .5 -.45 .75 .5 .4 .9 1];
[f, g] = SymLennardJones(10);
[min1, hist] = NelderMead(@(x) LennardJones(VtoM(x)), init10, 500);
%LennardJones(VtoM(min)); -27.3701 
figure('name', 'Minimum Energy Lennard-Jones cluster');
min1 = VtoM(min1);
plot3(min1(:,1), min1(:,2), min1(:,3), 'o');
title('Lennard-Jones cluster (n=10)');
hold on;
for j = 2:length(min1)
    for i = 1:j-1
        plot3([min1(i,1) min1(j,1)], [min1(i,2) min1(j,2)], [min1(i,3) min1(j,3)]);
    end
end
grid on


init11 = [1 1.4 .8 1 .42 .9 0 0.85 .15 .5 0 1.6 .5 1.4 .8 0 1 1.5 .5 -.45 .75 .5 .4 .9 1 .5 .5 .5 ];
[f, g] = SymLennardJones(11);
[min, hist] = NelderMead(@(x) LennardJones(VtoM(x)), init11, 500);
%LennardJones(VtoM(min)); -31.112
figure('name', 'Minimum Energy Lennard-Jones cluster');
min = VtoM(min);
plot3(min(:,1), min(:,2), min(:,3), 'o');
title('Lennard-Jones cluster (n=11)');
hold on;
for j = 2:length(min)
    for i = 1:j-1
        plot3([min(i,1) min(j,1)], [min(i,2) min(j,2)], [min(i,3) min(j,3)]);
    end
end
grid on