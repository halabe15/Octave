function [xf, i] = biseccion(x, eps, maxit)
  xf = ((x(1)+x(2))/2);
  i = 0;

  do
    if ((f(x(1))*f(xf))) > 0
      x(1) = xf;
    else
      x(2) = xf;
    end
    tmp = xf;
    xf = ((x(1)+x(2))/2);
    i++;
  until (abs(xf - tmp) < eps)
end
