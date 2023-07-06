%ask2
%b
lambda=5;
m=5.00001:0.001:10.00001;
[U, R, Q, X]=qsmm1(lambda, m);

figure(1)
plot(m, U, "linewidth", 1.5);
title("Server Utilization- Service Rate", "fontsize", 15);
xlabel("Service Rate(ì)", "fontsize", 13)
ylabel("Server Utilization(ñ)", "fontsize", 13);
axis([5 10]);

figure(2)
plot(m, R, "linewidth", 1.5);
title("Server response time- Service Rate", "fontsize", 15);
xlabel("Service Rate(ì)", "fontsize", 13);
ylabel("Server Response time (E[T])", "fontsize", 13);
axis([5 10 0 100]);

figure(3)
plot(m, Q, "linewidth", 1.5);
title("Average number of requests- Service Rate", "fontsize", 15);
xlabel("Service Rate(ì)", "fontsize", 13);
ylabel("Average number of requests", "fontsize", 13);
axis([5 10 0 100]);

figure(4)
plot(m, X, "linewidth", 1.5);
title("Server Troughput- Server Rate", "fontsize", 15);
xlabel("Server Rate(ì)", "fontsize", 13);
ylabel("Server Troughput", "fontsize", 13);
axis([5 10])


