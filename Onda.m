function Onda(xmin, xmax, t0, T, h, k, c, U0, UT)
%Resuelve numéricamente la ecuación de la onda.

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
%Éste es el primer tiempo i.e U(x,t1)
for i=1:size(x,2)
    Ucero(i)=Uantes(i);
end
%segundo plot inicial
plot(x,Ucero);
pause(3.*k);
%Ahora si empieza el método
for j=1:size(t,2)
    %Calcula los valores en t+1 con diferencias finitas
    %Es en éste paso donde se usa el método
    for i=1:(size(x,2))
     if i==1
      Unuevo(i)=2*Ucero(i)-Uantes(i)+(lambda.^2)*c.^2*(Ucero(i+1)-2*Ucero(i)+Ucero(size(x,2)));
        else if i==size(x,2)
        Unuevo(i)=2*Ucero(i)-Uantes(i)+(lambda.^2)*c.^2*(Ucero(1)-2*Ucero(i)+Ucero(i-1));
            else
                    %El importante
                    Unuevo(i)=2*Ucero(i)-Uantes(i)+(lambda.^2)*(c.^2)*(Ucero(i+1)-2*Ucero(i)+Ucero(i-1));
                end
     end
     end
    
    %hace el plot de lo que recién calculamos
    plot(x,Unuevo, '-s');
    axis([-2, 2, -2, 2])
    pause(3.*k);
    %waitforbuttonpress
    %Recorre los vectores
        for i=1:size(x,2)
            Uantes(i)=Ucero(i);
            Ucero(i)=Unuevo(i);
        end
end
end

