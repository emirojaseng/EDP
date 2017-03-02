%Este archivo solo es un script para tener los parametros a la mano y llamar a la función
%parametros
xmin=-2;
xmax=2;
t0=0;
T=5;
a=100; %algo para ahorita en la clase
h=1/a;
k=1/a;
c=1;
%Las f(x) dadas
U0=@(x) max(0, 1-abs(x));
UT=@(x) 0;
%llama a la función
Onda(xmin, xmax, t0, T, h, k, c, U0, UT);
