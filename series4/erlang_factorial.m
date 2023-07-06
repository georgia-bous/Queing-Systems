addpath(pwd);
function res = erlang_factorial(p,c)
    factor = (p^c)/factorial(c);
    denom = 0;
    for i= 0:c
        denom += (p^i)/factorial(i);
    end
    res = factor/denom;
endfunction
display(erlang_factorial(50,30)); %the result is indeed the same
display(erlangb(50,30));

display("Calculation with erlang_factorial");
display(erlang_factorial(1024,1024));
display(erlangb(1024,1024));

