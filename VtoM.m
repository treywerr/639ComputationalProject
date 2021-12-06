function m = VtoM(v)
  temp = zeros(length(v) + 4, 1);
  temp(5:length(temp)) = v;
  m = reshape(temp, 3, []).';
