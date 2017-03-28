function CalorEx(xmin, xmax, t0, T, h, k, c, U0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%crea la malla
x=xmin:h:xmax;
t=t0:k:T;

%inicializa los vecetores con ceros y el lambda
Uviejo=zeros(1,size(x,2));
Unuevo=zeros(1,size(x,2));
beta=k/(h^2);

%Setupea la condición inicial Uviejo=u(x,0)
for i=1:size(x,2)
    Uviejo(i)=U0(x(i));
end
%Este es el primer plot
plot(x,Uviejo);
pause(3.*k);

%verdadero proceso
for j=1:size(t,2)
    %Calcula los valorer en t+1 con diferencias finitas
    for i=1:size(x,2)
        if(i==1)
            Unuevo(i)=0;
        else if (i==size(x,2))
                Unuevo(i)=1;
            else
        Unuevo(i)=Uviejo(i)+c*beta*(Uviejo(i+1)-2*Uviejo(i)+Uviejo(i-1));
            end
        end
    end
    disp('listo')
    %hace el plot de lo que recién calculamos
    %waitforbuttonpress
    plot(x,Unuevo);
    pause(3.*k);
    %Pasa lo del vector nuevo al vector viejo
        for i=1:size(x,2)
            Uviejo(i)=Unuevo(i);
        end
end
end

