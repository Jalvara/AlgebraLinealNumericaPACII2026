%Pruebas de Convergencia metodo de maximo descenso
%Definiendo el tamaño del problema
n=10;nmax=300;tol=1e-5;
A=diag(4*ones(1,n))+diag(-1*ones(1,n-1),1)+...
diag(-1*ones(1,n-1),-1)+diag(-1*ones(1,n-3),3)+...
diag(-1*ones(1,n-3),-3);
b=zeros(n,1);
b(1,1)=2;b(n,1)=2;b(2,1)=1;b(3,1)=1;b(n-1,1)=1;b(n-2,1)=1;
xsol=ones(n,1);%solucion exacta.
x0=rand(n,1);
Er=zeros(6,1);
for j=1:6
  y=MaximoDescenso(A,b,x0,2^(j+1));
  Er(j,1)=log(norm(y-xsol));
endfor
ind=2.^[2,3,4,5,6,7];
plot(ind,Er,'-.');
