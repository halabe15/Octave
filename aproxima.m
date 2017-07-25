function [A,E] = aproxima(X, Y, N, O, P)
  A = 0;
  E = 0;
  hold on;

  if O == 0
    if length(X) <= N
      E = 1;
      return;
    end
    A = interpolacion(X, Y, N, P);
  elseif O == 1
    A = aproximacion(X, Y, N, P);
  end
end

function a = interpolacion(x, y, n, p)
  for i=1:length(x)
    plot(x(i), y(i), 'k');
  end

  for j=1:length(x)
    if p(1) > x(j) && p(1) < x(j+1)
    xTmp = [1, x(j); 1, x(j+1)];
    yTmp = [y(j), y(j+1)];
    a = gaussJordan(xTmp, yTmp, 1);
    end
  end

  for i=1:length(p)
    plot(p(i), a(1)+a(2)*p(i), 'b');
  end

  plot(x, a(1)+a(2)*x, 'r');

end

function a = aproximacion(x, y, n, p)
  sumX = sum(x);
  sumY = sum(y);
  sumXY = sum(x.*y);
  sumX2 = sum(x.^2);
  n = length(x);

  m = (sumXY - (sumX*sumY)/n)/(sumX2 - sumX2/n);
  b = (sumY/n) - m*(sumX/n);

  for i=1:n
    plot(x(i), y(i), 'k');
  end

  for i=1:length(p)
    plot(p(i), m*p(i)+b, 'b');
  end
  plot(x, m*x+b, 'r');

  for j=1:length(x)
    if p(1) > x(j) && p(1) < x(j+1)
    xTmp = [1, x(j); 1, x(j+1)];
    yTmp = [y(j), y(j+1)];
    a = gaussJordan(xTmp, yTmp, 1);
    end
  end

end
