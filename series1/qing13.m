clc;
clear all;
close all;

#TASK 1

lambda=5;
mean=1/lambda;
nevents=100;
x=exprnd(mean, 1,  nevents);
n=ones(nevents, 1);

for i=1:nevents-1
  x(i+1)=x(i+1)+x(i);
  n(i+1)=n(i)+1;
endfor

figure(1);
stairs(x, n)
title("Poisson process counting function with К =5 events/s" ,"fontsize", 16);
xlabel("Seconds(s)", "fontsize", 15);
ylabel("N(t)", "fontsize", 15);


#TASK 2

lambda=5;
mean=1/lambda;
nevents=[200, 300, 500, 1000, 10000];

for j=1: columns(nevents)
  x=exprnd(mean, 1,  nevents(j));
  
  for i=1:nevents(j)-1
    x(i+1)=x(i+1)+x(i); 
  endfor

  disp("Number of events="), disp(nevents(j));
  disp("К*дт="), disp(nevents(j)/x(nevents(j)));
endfor
