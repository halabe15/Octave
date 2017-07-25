function X = puntoFijo(X0)
  MAXIT = 20;
  EPS = 1;
  converge = false;
  for j=1:MAXIT
    X = g(X0);
    if abs(X - X0) < EPS
      converge = true;
      break;
    end
    X0 = X;
  end
    if !converge
      X = 'Diverge';
    end
end
