%Este archivo solo es un script para tener los parametros a la mano y llamar a la función
%parametros
xmin=-4;
xmax=4;
t0=0;
T=7;
a=10; %algo para ahorita en la clase
h=1/a;
k=1/a;
c=1;
%La f(x) dada
U0=@(x) flujo(x);
%llama a la función
FwTBwS(xmin, xmax, t0, T, h, k, c, U0);
