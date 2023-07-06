%ask22

function [p1, p2, p3, p4, p5, is_ergodic]= intensities(l1, l2, m1, m2, m3, m4, m5)
  p1=l1/m1;
  p2=(l2+(2/7)*l1)/m2;
  p3=(4/7)*l1/m3;
  p4=(3/7)*l1/m4;
  p5=((4/7)*l1+l2)/m5;

  if (p1<1 && p2<1 && p3<1 && p4<2 && p5<1)
    is_ergodic=1;
  else
    is_ergodic=0;
  endif

  display("p1 =")
  disp(p1)
  display("p2 =")
  disp(p2)
  display("p3 =")
  disp(p3)
  display("p4 =")
  disp(p4)
  display("p5 =")
  disp(p5)

endfunction


