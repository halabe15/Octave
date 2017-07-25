function [x,E,i] = noLineal(x0, eps, maxit, metodo)

  if metodo
    [x, E, i] = Secante(x0, eps, maxit);
  else
    [x, E, i] = NewtonRaphson(x0, eps, maxit);
  end
end

function [x,E,i] = NewtonRaphson(x0, eps, maxit)
  x = 0;
  E = 0;
  i = 1;
  raiz = false;

  while i < maxit
    x = x0 - f(x0)/df(x0);
    if abs(x-x0) < eps
      raiz = true;
      break
    end
    i++;
    x0 = x;
  end

  if raiz
    E = 0;
  else
    E = 1;
    x = 'El método no converge';
  end
end

function [x,E,i] = Secante(x0, eps, maxit)
  x = 0;
  E = 0;
  i = 1;
  raiz = false;

  while i < maxit
    if abs(x0(2)-x0(1)) < eps
      raiz = true;
      break
    end
    tmp = x0(2)-((f(x0(2))*(x0(2)-x0(1)))/(f(x0(2))-f(x0(1))));
    x0(1) = x0(2);
    x0(2) = tmp;
    i++;
  end

  if raiz
    E = 0;
    x = x0(2);
  else
    E = 1;
    x = 'El método no converge';
  end
end
