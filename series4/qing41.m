%4b
p = 200*23/60;
c = 1:200;
for lines=1:200  %the capacity of the system for each case
    block(i) = erlang_iterative(p,lines);
endfor
figure(1);
hold on;
title("Probabilities per state", "fontsize", 17)
xlabel("State", "fontsize", 15)
ylabel("Probability", "fontsize", 15)
plot(c, block, "linewidth", 1.6);


%4c
P=1; %starting from 0 lines, the probability to lose a client is 1
lines = 0;
while P>0.01
    P = erlang_iterative(p,lines);
    lines++;
endwhile
display(lines);

