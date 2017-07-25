function [R, E, M] = operaMatrices(A, B, N)
% Recibe 2 Matrices y un número, devuelve una matriz, un numero de error y un mensaje.

  % Guardamos valores del tamaño de las dos matrices dadas para ver mas adelante si se pueden operar.
  [w,x] = size(A);
  [y,z] = size(B);

  % Asignamos valores por default a las variables que vamos a regresar.
  R = [];
  E = 0;
  M = 'No hay Error';

  % Dividimos por casos de operaciones
  switch(N)
    case 0
    % Suma de matrices.
      if w == y && x == z
      % Comprobamos que las dimensiones acepten sumarse.
        R = sumaM(A, B);
      else
        [R, E, M] = dimensiones();
        % Función en la cual asigna valores a las variables a regresar para enviar un error de dimensiones.
      end
    case 1
    % Resta de Matrices
      if w == y && x == z
      % Comprobamos que las dimensiones acepten restarse.
        R = restaM(A, B);
      else
        [R, E, M] = dimensiones();
        % Función en la cual asigna valores a las variables a regresar para enviar un error de dimensiones.
      end
    case 2
    % Multiplica Matrices
      if x == y
        R = multM(A, B);
      else
        [R, E, M] = dimensiones();
        % Función en la cual asigna valores a las variables a regresar para enviar un error de dimensiones.
      end
    case 3
    % Calcula la media y desviación standard por renglon.
      R = mediaDesv(A, B);
    case 4
    % Calcula máximos y mínimos por columna.
      R = maxMin(A);
    otherwise
    % Caso en el que nos envien un parametro que no existe.
      R = [];
      E = 1;
      M = 'Operacion NO EXISTE';
  endswitch
end

function r = sumaM(a, b)
% Suma dos marices ya aceptadas por su tamaño.
  [x, y] = size(a);
  % Guardamos valores del tamaño de la Matriz.

  for j=1:x
  % Ciclo para las vueltas
    for k=1:y
    % Ciclo para las columnas
      r(j, k) = a(j, k) + b(j, k);
      % En la posicion adecuada, sumamos las mismas posiciones en las matrices.
    end
  end
end

function r = restaM(a, b)
  [x, y] = size(a);
  % Guardamos valores del tamaño de la Matriz.

  for j=1:x
  % Ciclo para las filas
    for k=1:y
    % Ciclo para las columnas
      r(j, k) = a(j, k) - b(j, k);
      % En la posicion adecuada, restamos las mismas posiciones en las matrices.
    end
  end
end

function r = multM(a, b)
  [fa,ca]=size(a);
  [fb,cb]=size(b);
  % Guardamos valores del tamaño de la Matriz.

  for j=1:cb
  % Ciclo para las columnas de la matriz R
    for k=1:fa
    % Ciclo para las filas de la Matriz R
      sum=0;
      for l=1:ca
      % Ciclo para las columnas y filas que se multiplicaran.
        sum += (a(k, l) * b(l, j));
        % Se va sumando la multiplicación de cada resultado por individual para una sola posición.
      end
      r(k, j) = sum;
      % Hace a la posición en matriz R el resultado.
    end
  end
end

function r = mediaDesv(a)
% Recibimos una sola matriz y devolvemos otra matriz con medias y desviaciones standard de cada renglón.
  [x,y] = size(a);

  % Ciclo para calcular media.
  for j=1:x
    sum=0;
    sum2=0;
    for k=1:y
      % Sumamos todos los datos.
      sum += a(j, k);
      % Sumamos los datos al cuadrado
      sum2 += a(j, k)^2;
    end
    % Media de los datos sumados.
    r(j, 1) = sum/k;
    % Desviación Standard por cada renglón.
    tmp = (sum2/y) - (r(j, 1)^2);
    r(j, 2) = sqrt(tmp);
  end
end

function r = maxMin(a)
% Recibe una matriz y devuelve otra con máximos en primera fila y mínimos en segunda fila.
  r = [max(a);min(a)];
end

function [R, E, M] = dimensiones()
% No recibe nada, devuelve las variables marcando errores.
  R = [];
  E = 1;
  M = 'Dimensiones no compatibles';
end
