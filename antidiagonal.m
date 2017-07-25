function result = antidiagonal(dimension)
  result(dimension, dimension) = 0;
  for i=1:dimension
    result(i,dimension-(i-1)) = 1;
  end
end
