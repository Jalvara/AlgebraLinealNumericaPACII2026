function y=MaximoDescenso(A,b,x0,m)
  p0=b-A*x0;
  for j=1:m
    a=(p0'*p0)/(p0'*A*p0);
    y=x0+a*p0;
    p0=b-A*y;
    x0=y;
  endfor
endfunction

