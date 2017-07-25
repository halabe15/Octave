function B = binario(D, N)
  B = '';
  for j=1:N
    D *= 2;
    if D == 1
      B = [B '1'];
      for k=length(B):N-1
        B = [B '0'];
      end
      return;
    end
    if D>1
      B = [B '1'];
      D--;
    else
      B = [B '0'];
    end
  end
end
