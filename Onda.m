function Onda(xmin, xmax, t0, T, h, k, c, U0, UT)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%crea la malla
x=xmin:h:xmax;
t=t0:k:T;
%inicializa los vecetores con ceros y el lambda
Uantes=zeros(1,size(x,2));
Ucero=zeros(1,size(x,2));
Unuevo=zeros(1,size(x,2));
lambda=k/h;

%Setupea la condición inicial Uviejo=u(x,0)
for i=1:size(x,2)
    Uantes(i)=U0(x(i));
end
%Este es el primer plot inicial
plot(x,Uantes);
pause(3.*k);

%Éste es el primer tiempo i.e U(x,t1
for i=1:size(x,2)
    Ucero(i)=UT(x(i));
end
%segundo plot inicial
plot(x,Ucero);
pause(3.*k);

%Ahora si empieza el método
for j=1:size(t,2)
    %Calcula los valores en t+1 con diferencias finitas
    %Es en éste paso donde se usa el método
    for i=1:(size(x,2)) %Toma en cuenta la "malla" que utiliza
     %   if i==1
      %    Unuevo(i)=2*Ucero(i)-Uantes(i)+(lambda.^2)*c.^2*(Ucero(i+1)-2*Ucero(i)+Ucero(size(x,2)))
       % else if i==size(x,2)
        %        Unuevo(i)=2*Ucero(i)-Uantes(i)+(lambda.^2)*c.^2*(Ucero(1)-2*Ucero(i)+Ucero(i-1))
         %   else
    Unuevo(i)=2*Ucero(i)-Uantes(i)
    +(lambda.^2)*c.^2*(Ucero(mod(i+1,size(x,2)))-2*Ucero(i)+Ucero(mod(i-1),size(x,2)));
        %    end
       % end
    end
    disp('listo')
    %hace el plot de lo que recién calculamos
    plot(x,Unuevo);
    pause(3.*k);
    %Recorre los vectores
        for i=1:size(x,2)
            Uviejo(i)=Ucero(i);
            Ucero(i)=Unuevo(i);
        end
end
end

