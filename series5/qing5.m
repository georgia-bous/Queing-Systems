%ask1

a = 0.001:0.001:0.999;
l = 10000;
l1 = 10000*a;
l2 = 10000*(1-a);
C1=15000000;
p_size_bits= 128*8;
C2=12000000;
m1=C1/p_size_bits;
m2=C2/p_size_bits;

[U1, R1, Q1, X1, P1] = qsmm1(l1, m1); %Q= the average number of requests
[U2, R2, Q2, X2, P2] = qsmm1(l2, m2);

sumClients = Q1 + Q2;
T = sumClients/l;
figure(1);
plot(a, T);
xlabel("a", "fontsize", 15,'fontweight', 'bold');
ylabel("Mean time in the system","fontsize", 15, 'fontweight', 'bold');
title("E[T]", "fontsize", 18)


[minT, mina] =min(min(T,[],1)); %min(min(T,[],1) sets minT to the min value of the matrix T and
                                %mina to the column where minT is
display("Minimun value of E(T)")
disp(minT)
display("is achieved with a=")
disp(0.001*mina)   %999 columns, each corresponds to one value of a:0.001-0.999->multiply with 0.001



%ask24
l1 = 4;
l2 = 1;
m1 = 6;
m2 = 5;
m3 = 8;
m4 = 7;
m5 = 6;

[q1, q2, q3, q4, q5] = mean_clients(l1, l2, m1, m2, m3, m4, m5);
display("Average time in the system:")
disp((q1+q2+q3+q4+q5)/(l1+l2))



%ask26
l2 = 1;
m1 = 6;
m2 = 5;
m3 = 8;
m4 = 7;
m5 = 6;
maxl1 = 6;
for i = 1:1:90
  l1 = 0.1*maxl1+(i-1)*0.01*maxl1;
  [q1, q2, q3, q4, q5] = mean_clients(l1, l2, m1, m2, m3, m4, m5);
  delay(i)= (q1+q2+q3+q4+q5)/(l1+l2);
endfor

l = (0.1*maxl1):(0.01*maxl1):(0.99*maxl1);
plot(l, delay);
xlabel("λ1","fontsize",18);
ylabel("E(T)", "fontsize", 18);
title("Average delay for different values of λ1", "fontsize", 19)

