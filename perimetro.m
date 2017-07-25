function r = perimetro(m)
  r = 0;
  for j=1:(length(m)-1)
    r += distancia(m(1,j), m(1,j+1), m(2,j), m(2,j+1));
  end
  r += distancia(m(1,length(m)), m(1,1), m(2,length(m)), m(2,1));
end

function r = distancia(x0, x1, y0, y1)
  r = sqrt((x0-x1)^2+(y0-y1)^2);
end
