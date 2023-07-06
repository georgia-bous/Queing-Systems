%ask3
%b

m=10;
lambda=5;
N=4;
states = [0, 1, 2, 3, 4]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0];

%i
births_B = [lambda, lambda/2, lambda/3, lambda/4];
deaths_D = [m, m, m, m];
Q=ctmcbd(births_B, deaths_D)

%ii
P=ctmc(Q)
figure(1);
bar(states, P, "r", 0.5);
title("Probabilities of M/M/1/4", "fontsize", 14)
xlabel("States", "fontsize", 14)
ylabel("Probabilities", "fontsize", 14)

%iii
mean_num_clients=0;
for i=1: 1:N+1
  mean_num_clients=mean_num_clients+(i-1)*P(i);  %array indexes starts from 1
endfor

display(mean_num_clients);

%iv
Pblocking=P(N+1);
display(Pblocking);

%v
for i = 1:1:N+1
  index = 0;
  for T = 0 : 0.01 : 50
    index = index + 1;
    Pn = ctmc(Q, T, initial_state);
    Probn(index) = Pn(i);
    if Pn - P < 0.01
      break;
    endif
  endfor

  t = 0 : 0.01 : T;
  figure(i+1);
  plot(t, Probn, "linewidth", 1.3);
  title("Transient probability until convergence");
  xlabel("Time");
  ylabel("Transient Probability");
endfor


