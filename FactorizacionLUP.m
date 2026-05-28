function [P,L,U]=FactorizacionLUP(A)
  n=length(A);
  L=eye(n);
  P=eye(n);
  for k=1:n-1
    [maximo,ik]=max(abs(A(k:n,k)));
    ik=ik+k-1;
    v=A(k,:);
    A(k,:)=A(ik,:);
    A(ik,:)=v;
    v=P(k,:);
    P(k,:)=P(ik,:);
    P(ik,:)=v;
    L(k+1:n,k)=A(k+1:n,k)/A(k,k);
    for j=1:k-1
      s=L(k,j);
      L(k,j)=L(ik,j);
      L(ik,j)=s;
    endfor
    for j=k+1:n
      A(j,:)=A(j,:)-L(j,k)*A(k,:);
    endfor
  endfor
  U=A;
endfunction