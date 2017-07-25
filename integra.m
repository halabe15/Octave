function y = integra(n, x0, x1, paso)
  sum = 0;
  for j=x0:paso:x1
    x0 = j;
    x1 = eval(n);
    sum += x0 + j*((x1-x0)/paso);
  end
y = sum;
end
