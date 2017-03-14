function Onda2D(xmin, xmax, ymin, ymax, t0, T, h, l, k, c, U0, UT)
%Resuelve numéricamente la ecuación de la onda.

%crea la malla
x=xmin:h:xmax;
y=ymin:l:ymax;
t=t0:k:T;

%inicializa los vecetores con ceros, lambda y mu
Uantes=zeros(size(x,2),size(y,2));
Ucero=zeros(size(x,2),size(y,2));
Unuevo=zeros(size(x,2),size(y,2));
lambda=k/h;
mu=k/l;

%Setupea la condición inicial Uviejo=u(x,y,0)
for j=1:size(y,2)
    for i=1:size(x,2)
      Uantes(i,j)=U0(x(i),y(j));  
    end
end
%Este es el primer plot inicial
plot(x,y,Uantes(x,y))

end

