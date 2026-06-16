function y=MetodoJacobi(A,b,x0,nmax,tol)
  n=length(A);%Dimension de la matriz.
  y=zeros(n,1);%Vector columna de n ceros.
  for k=1:nmax
    %Actualizacion de y
    %for i=1:n
    %  y(i,1)=(b(i,1)-A(i,:)*x0+A(i,i)*x0(i,1))/A(i,i);
    %endfor
    y=-[x0(2:n,1);0]-[0;x0(1:n-1,1)]...
    -[x0(4:n,1);0;0;0]-[0;0;0;x0(1:n-3,1)];
    y=(-y+b)./diag(A);
    %Revisar tolerancia del problema
    if norm(y-x0)<tol
      disp("Numero de iteraciones: ");
      disp(k);
      disp("Se alcanzo la tolerancia");
      break
    endif
    x0=y;
  endfor
endfunction
