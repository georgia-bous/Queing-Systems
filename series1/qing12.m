clc;
clear all;
close all;

# TASK 1

k = 0:0.0001:8;
mean = [0.5, 1, 3];

for i = 1 : columns(mean)
  exp(i, :) = exppdf(k, mean(i));
endfor

colors = "rbkm";
figure(1);
hold on;
for i = 1 : columns(mean)
  plot(k, exp(i, :), colors(i), "linewidth", 1.4);
endfor
hold off;

title("Probability Mass Function of Exponential processes", "fontsize", 15);
xlabel("k values", "fontsize", 15);
ylabel("Probability", "fontsize", 15);
legend("1/ë=0.5", "1/ë=1", "1/ë=3", "fontsize", 15);


#TASK 2

k = 0:0.0001:8;
mean = [0.5, 1, 3];

for i = 1 : columns(mean)
  exp(i, :) = expcdf(k, mean(i));
endfor

colors = "rbkm";
figure(2);
hold on;
for i = 1 : columns(mean)
  plot(k, exp(i, :), colors(i), "linewidth", 1.4);
endfor
hold off;

title("Cumulative Distribution Function of Exponential processes", "fontsize", 15);
xlabel("k values", "fontsize", 15);
ylabel("Probability", "fontsize", 15);
legend("1/ë=0.5", "1/ë=1", "1/ë=3", "fontsize", 15);


#TASK 3

k = 0:0.0001:8;
mean= 2.5;
exp= expcdf(k, mean);
p1=1-exp(3000)
p2= (1- exp(5000))./(1-exp(2000))