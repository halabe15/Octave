function [R, E] = convierteReal(n, m, e, b)

  % Inicializamos valores a regresar
  R = 0;
  E = 'No hay Error';

  switch (b)

    case 0
      % Conversion de decimal a binario
      R = dec2binFlotante(n, m, e);
      R2 = bin2decFlotante(R, m, e);
      E = n - R2;

    case 1
      % Conversion de biario a decimal
      R = bin2decFlotante(n, m, e);
  end
end

function R = dec2binFlotante(n, m, e)
% Convierte un decimal a una palabra en bits, formada por mantisa y exponente especificados.
  R = '';

  %Agregamos el primer digito a R, dependiendo del signo 0=+ 1=-
  if n > 0
    R = '0';
  else
    R = '1';
  end

  if abs(n) < 1
    R = [R '1'];
  else
    R =  [R '0'];
  end

  % Tomamos valor absoluto y dividimos la parte entera y la decimal
  int = abs(fix(n));
  dec = abs(n) - int;
  % Convertimos dec a binario y a string
  int = num2str(dec2bin(int));
  % Tomamos la cantidad de bits que nos quedan para recolectar decimales
  tmp = m - length(int);

  % Convertimos los decimales a binario
  binDec = '';
  for j=1:tmp
    dec = dec * 2;
    if dec >= 1
      binDec = [binDec '1'];
      dec--;
    else
      binDec = [binDec '0'];
    end
  end

  %carlos.afdz@gmail.com


   if int == num2str(0)
     % Guardamos y eliminamos los 0s antes del primer 1 para normalizar.
     tmp=0;
     lenBinDec = length(binDec);
     for j=1:lenBinDec
       if binDec(1) == '0'
         binDec(1) = '';
         tmp++;
       else
         % Llegamos al primer 1.
         break;
       end
     end

     % Guardamos el exponente en binario
     eBin = dec2bin(tmp);

     % Convertimos el exponente binario a str y agregamos 0s antes del exponente binario si se necesitan.
     tmp = num2str(eBin);
     for j=length(tmp):e-1
       R = [R '0'];
      end

    % Juntamos todos los elementos de la palabra y la guardamos en R
     R = [R eBin binDec];
     for j=length(R):(m + e + 1)
       % Si nos sobraron bits los llenamos de 0s.
       R = [R '0'];
     end
   else
     % Guardamos la cantidad de digitos que tiene el entero para normalizar
     eBin = dec2bin(length(int));
     % Hacemos string el exponente en binario
     tmpEx = num2str(eBin);
     % Si nos solicitan x num para e y la longitud es mayor, agregar 0s.
     for j=length(tmpEx):e-1
        R = [R '0'];
      end
    % Juntamos todos los elementos de la palabra y la guardamos en R
     R = [R eBin int binDec];
   end

 end

function R = bin2decFlotante(n, m, e)
% Convierte una palabra en bits a un decimal, formada por mantisa y exponente especificados.
  R = 0;
  % Separamos la palabra en sus posiciones
  signo = str2num(n(1));
  signoEx = str2num(n(2));
  eBin = bin2dec(n(3:(2+e)));
  % n guarda el numero y los decimales si existen.
  n = n((3+e):length(n));

  if signoEx == 0
  % Si el signo del exponente es 0 existen enteros.
    if eBin>length(n)
      for j=1:eBin-1
      % Si el exponente es mas grande del tamaño de n se le agregan 0 a la derecha para poder leerlo.
        n = [n '0'];
      end
    end
    % Separamos el entero de los decimales y se convierte a decimal.
    int = (n(1:eBin));
    int = bin2dec(int);
    % Guardamos decimales en dec.
    dec = n(eBin+1:length(n));
  else
  % Si el signo del exponente es 1 NO existen enteros.
    int = 0;
    dec = n;
    for j=1:eBin-1
    % Se recorre el punto a la izq la cantidad de posiciones según el exponente.
      dec = ['0' dec];
    end
  end

  % Inicializamos la sumatoria para la conversion de punto flotante a decimal.
  tmpSum = 0;
  tmpSize = length(dec);
  for j=1:tmpSize
    if dec(j) == '1'
    % Se le suma dependiendo su posición del punto flotante.
      tmpSum += 1/(2^j);
    end
  end

  % Revisamos si el signo era + ó - y se escribe.
  if signo == 0
    R = int + tmpSum;
  else
    R = -abs(int + tmpSum);
  end

end
