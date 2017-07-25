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
