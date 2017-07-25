function [x, Ainv, d, Solucion] = gaussJordan(A, b, op)
  x = 0;
  Ainv = 0;
  d = 0;
  Solucion = 0;

  if op == 1
    [Solucion, x] = solucionX(A, b);
  elseif op == 2
    [Solucion, Ainv, d] = inversa(A);
  end
end

function [s, x] = solucionX(a, b)
  [f, c] = size(a);
  x(c) = 0;

  s=0;

  for i=1:f
    cambio = a(i,i);
    numCambio = 0;
    for j=i:f
      if a(j, i) > cambio
        cambio = a(j,i);
        numCambio = j;
      end
    end

    if numCambio ~= 0
      a = cambioFila(a, numCambio, i);
      b = cambioFila(b', numCambio, i)';
    end

    aPasado = a;
    bPasado = b;

    for j=1:f
      if i ~= j
        for k=1:c
          a(j, k) = -(aPasado(j, i)/aPasado(i, i))*aPasado(i, k)+aPasado(j, k);
        end
        b(j) = -(aPasado(j, i)/aPasado(i, i))*bPasado(i)+bPasado(j);
      end
    end
    aPasado = a;
    bPasado = b;
  end

  for i=1:f
    x(i) = b(i)/a(i,i);
  end

  s=1;

end

function [s, A, d] = inversa(a)
  deter = determinante(a);

  if deter == 0
    s=0;
    A=0;
    d=0;
    break;
  end
  
  [f, c] = size(a);
  a = [a, eye(f)];
  [f, c] = size(a);
  signoDet = 0;

  for i=1:f
    cambio = a(i,i);
    numCambio = 0;
    for j=i:f
      if a(j, i) > cambio
        cambio = a(j,i);
        numCambio = j;
      end
    end

    if numCambio ~= 0
      a = cambioFila(a, numCambio, i);
      signoDet++;
    end

    aPasado = a;

    for j=1:f
      if i ~= j
        for k=1:c
          a(j, k) = -(aPasado(j, i)/aPasado(i, i))*aPasado(i, k)+aPasado(j, k);
        end
      end
    end
    aPasado = a;
  end

  d = 1;

  for i=1:f
    for j=1:(length(a)/2)
      A(i, j) = a(i, j+3) / a(i, i);
    end
    d *= a(i, i);
  end

  if mod(signoDet, 2) ~= 0
    d *= -1;
  end

  s=2;

end

function r = cambioFila(a, f1, f2)
  r = a;
  r(f1,:) = a(f2,:);
  r(f2,:) = a(f1,:);
end

function d = determinante(a)
  a = [a, a];
  [f, c] = size(a);

  mult1 = 1;
  mult2 = 1;
  sum1 = 0;
  sum2 = 0;

  for i=1:f
    for j=1:c/2
      mult1 *= a(j,j+i);
      mult2 *= a(j, c-j-i+1);
    end
    sum1+=mult1;
    sum2+=mult2;
    mult1 = 1;
    mult2 = 1;

  end
  d = sum1-sum2;
end
