%Este archivo solo es un script para tener los parametros a la mano y llamar a la función
%parametros
xmin=-1;
xmax=1;
ymin=-1;
ymax=1;
t0=0;
T=10;
a=10; %algo para ahorita en la clase
h=1/a;
l=1/a;
k=1/a;
c=1;
n=1;
%Las f(x) dadas
U0=@(x,y) exp(-(x+y)^2);
UT=@(x,y) 0;
%llama a la función
Onda2D(xmin, xmax, ymin, ymax, t0, T, h, l, k, c, U0, UT);
