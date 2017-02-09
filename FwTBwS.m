function FwTBwS(xmin, xmax, t0, T, h, k, c, U0)
%Forward Time Backward Space: resuelve numéricamente el comportamiento de
%la EDP de transporte Ut+c*Ux=0 con U(x,0)=f(x)
%   (xmin,xmax) es el intervalo en el que se calcula la función
%   (t0,T) es el tiempo inicial y algun tiempo final
%   (h, k) es el espaciamiento (h) y el paso del tiempo (k) de la malla
%   c es de la ecuación de transporte
%   U0 es la función f(x)


%crea la malla
x=xmin:h:xmax;
t=t0:k:T;
%inicializa los vecetores con ceros y el lambda
Uviejo=zeros(1,size(x,2));
Unuevo=zeros(1,size(x,2));
lambda=k/h;

%Setupea la condición inicial Uviejo=u(x,0)
for i=1:size(x,2)
    Uviejo(i)=U0(x(i));
end
%Este es el primer plot
plot(x,Uviejo);
pause(3.*k);


%Éste va a ser el verdadero proceso
for j=1:size(t,2)
    %Calcula los valorer en t+1 con diferencias finitas
    %Es en éste paso donde se usa el método Forward Time-Backward Space
    for i=(1+j):size(x,2)
        Unuevo(i)=Uviejo(i)-c*lambda*(Uviejo(i)-Uviejo(i-1));
    end
    disp('listo')
    %hace el plot de lo que recién calculamos
    plot(x,Unuevo);
    pause(3.*k);
    %Pasa lo del vector nuevo al vector viejo
        for i=1:size(x,2)
            Uviejo(i)=Unuevo(i);
        end
end
end

