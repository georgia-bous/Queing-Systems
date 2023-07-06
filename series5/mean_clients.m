%ask23

function [q1, q2, q3, q4, q5]=mean_clients(l1, l2, m1, m2, m3, m4, m5)
  [p1, p2, p3, p4, p5, is_ergodic]=intensities(l1, l2, m1, m2, m3, m4, m5);
  if (is_ergodic==1)
    q1=p1/(1-p1);
    q2=p2/(1-p2);
    q3=p3/(1-p3);
    q4=p4/(1-p4);
    q5=p5/(1-p5);
  endif;
endfunction
