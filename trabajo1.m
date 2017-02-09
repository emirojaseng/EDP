%Éste archivo solo es un script para tener los parametros a la mano y llamar a la función
%parametros
xmin=-2;
xmax=5;
t0=0;
T=15;
h=.01;
k=.01;
c=1;
%La f(x) dada
U0=@(x) max(1-abs(x), 0);
%llama a la función
FwTBwS(xmin, xmax, t0, T, h, k, c, U0);
