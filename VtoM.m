function m = VtoM(v)
  temp = zeros(length(v) + 5, 1);
  temp(6:length(temp)) = v;
  m = reshape(temp, 3, []).';
