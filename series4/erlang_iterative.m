addpath(pwd);
function res = erlang_iterative(p,n)
    i = 0;
    res = 1;
    for i=0:n
        res = p * res/(p*res + i);
    end
endfunction

display(erlang_iterative(50,30)); %the result is indeed the same
display(erlangb(50,30));

display("Calculation with erlang_iterative");
display(erlang_iterative(1024,1024));
display(erlangb(1024,1024));

