function [L,U]=FactorizacionLU(A)
  n=length(A);
  L=eye(n);
  for i=1: n-1
    L(i+1:n,i)=A(i+1:n,i)/A(i,i);
    for k=i+1:n
      A(k,i)=0;
      for j=i+1:n
        A(k,j)=A(k,j)-L(k,i)*A(i,j);
      endfor
    endfor
  endfor
  U=A;
endfunction