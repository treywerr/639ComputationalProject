function potential = LennardJones(points)
  %points should be a n x 3 matrix
  [n, m] = size(points);
  potential = 0;
  for j = 1:n
    for i = 1:j-1
      r = sqrt((points(i,1) - points(j,1))^2 + (points(i,2) - points(j,2))^2 + (points(i,3) - points(j,3))^2);
      potential = potential + 1/r^12 - 2/r^6;
    end
  end
