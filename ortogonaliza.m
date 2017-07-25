function [VO,R] = ortogonaliza (V,eps)
  R = 0;

  [f, c] = size(V);

  VO(1,:) = V(1,:);

  for i=2:f
      VO(i,:) = V(i,:);
      for j=2:i
        VO(i,:) -= alfa(VO(j-1,:), V(i,:));
      end
  end

  R = rank(VO);
end

function x = alfa(a, b)
  y = true;
  for i=1:length(a)
    if a(i) ~= 0
      y = false;
    end
  end
  if y == true
    x(length(a)) = 0;
    return;
  end
  x = (prodPunto(a, b)/prodPunto(a,a)) .* a
end

function x = prodPunto(a, b)
  x = a * b';
end
