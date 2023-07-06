%ask2
% Note: Due to ergodicity, every state has a probability >0.

clc;
clear all;
close all;

%rand('seed', 1)

N=10;

lambda = [1, 5, 10];
m=5;

for k=1:1:3
rand('seed', 1)
P=[0 0 0 0 0 0 0 0 0 0 0];
arrivals=[0 0 0 0 0 0 0 0 0 0 0]; %arrivals(i)->how many arrivals i have totally
                                  %from state i, i=0- N

clear('to_plot');
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;
threshold(k) = lambda(k)./(lambda(k) + m); % the threshold used to calculate probabilities

transitions = 0; % holds the transitions of the simulation in transitions steps

while transitions >= 0
  transitions = transitions + 1; % one more transitions step

  if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
    index = index + 1;
    for i=1:1:N+1
        P(i) = arrivals(i)/total_arrivals; % calcuate the probability of every state in the system
    endfor
    mean_clients = 0; % calculate the mean number of clients in the system
    for i=1:1:N+1
       mean_clients = mean_clients + (i-1).*P(i);  %mean=Σk*P(k), k=0,..., N, but the enumeration of
                                                   %array starts at one, so P(0)->P(1),..
    endfor

    to_plot(k,index) = mean_clients;    %keep track of mean value of clients every 1000 transitions

    if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
      break;
    endif

    previous_mean_clients = mean_clients;
  endif

  random_number = rand(1); % generate a random number (Uniform distribution)
  if current_state == 0 || random_number < threshold(k) % arrival
    if current_state<11   %i don't count clients that come in a full system
      total_arrivals = total_arrivals + 1;
      arrivals(current_state + 1)++;
      if current_state<10
       current_state = current_state + 1;
      endif
    endif
  else % departure
    if current_state != 0 % no departure from an empty system
      current_state = current_state - 1;
    endif
  endif
endwhile

display("Probabilities of each state for λ=");
disp(lambda(k));
for i=0:1:N
  display(P(i+1));
endfor


figure(2*k-1);
plot(to_plot(k,:),"r","linewidth",1.3);
title("Average number of clients in the M/M/1 queue: Convergence");
xlabel("transitions in thousands");
ylabel("Average number of clients");
hold off

figure(2*k);
x=[0 1 2 3 4 5 6 7 8 9 10];
bar(x, P,'r',0.4);
title("Probabilities")
endfor
