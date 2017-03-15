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
disp('listo')
%Este es el primer plot inicial)
surf(x,y,Uantes(:,:))


%Éste es el primer tiempo i.e U(x,t1)
for j=1:size(y,2)
    for i=1:size(x,2)
    Ucero(i,j)=Uantes(i,j);
    end
end
%segundo plot inicial
surf(x, y, Ucero(:,:));
pause(3.*k);
%Ahora si empieza el método
 for tiempo=1:size(t,2)
     for j=1:size(y,2)
         for i=1:size(x,2)
   %Para poner las condiciones de frontera
   
%El peor codigo que he hecho en mi vida
%si j=1
if(j==1)
    if(i==1)
        Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
        (lambda^2*(Ucero(i+1,j)-2*Ucero(i,j)+Ucero(size(x,2),j))+...
         mu^2*(Ucero(i,j+1)-2*Ucero(i,j)+Ucero(i,size(x,2))));
    else if(i==size(x,2))
            Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
        (lambda^2*(Ucero(1,j)-2*Ucero(i,j)+Ucero(i-1,j))+...
         mu^2*(Ucero(i,j+1)-2*Ucero(i,j)+Ucero(i,size(x,2))));
        else
         Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
        (lambda^2*(Ucero(i+1,j)-2*Ucero(i,j)+Ucero(i-1,j))+...
         mu^2*(Ucero(i,j+1)-2*Ucero(i,j)+Ucero(i,size(x,2))));
        end
    end
 %si j es el ultimo
else if(j==size(y,2))
    if(i==1)
        Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
    (lambda^2*(Ucero(i+1,j)-2*Ucero(i,j)+Ucero(size(x,2),j))+...
    mu^2*(Ucero(i,1)-2*Ucero(i,j)+Ucero(i,j-1)));
    else if (i==size(x,2))
            Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
    (lambda^2*(Ucero(1,j)-2*Ucero(i,j)+Ucero(i-1,j))+...
    mu^2*(Ucero(i,1)-2*Ucero(i,j)+Ucero(i,j-1)));
        else
            Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
    (lambda^2*(Ucero(i+1,j)-2*Ucero(i,j)+Ucero(i-1,j))+...
    mu^2*(Ucero(i,1)-2*Ucero(i,j)+Ucero(i,j-1)));
        end
    end
    else if(i==size(x,2))
            Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
    (lambda^2*(Ucero(1,j)-2*Ucero(i,j)+Ucero(i-1,j))+...
    mu^2*(Ucero(i,j+1)-2*Ucero(i,j)+Ucero(i,j-1)));
    else if(i==1)
            Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
    (lambda^2*(Ucero(i+1,j)-2*Ucero(i,j)+Ucero(size(x,2),j))+...
    mu^2*(Ucero(i,j+1)-2*Ucero(i,j)+Ucero(i,j-1)));
        else Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
    (lambda^2*(Ucero(i+1,j)-2*Ucero(i,j)+Ucero(i-1,j))+...
    mu^2*(Ucero(i,j+1)-2*Ucero(i,j)+Ucero(i,j-1)));
        end
    end
end
% %%%Éste es el proceso importante
% Unuevo(i,j)=2*Ucero(i,j)-Uantes(i,j)+c^2*...
% (lambda^2*(Ucero(i+1,j)-2*Ucero(i,j)+Ucero(i-1,j))+...
% mu^2*(Ucero(i,j+1)-2*Ucero(i,j)+Ucero(i,j-1)));
   end
   end

    %hace el plot de lo que recién calculamos
    surf(x, y, Unuevo(:,:));
    axis([xmin, xmax, ymin, ymax,-5,5])
    pause(3.*k);
    %waitforbuttonpress
    %Recorre los vectores
    for j=1:size(y,2)
        for i=1:size(x,2)
            Uantes(i,j)=Ucero(i,j);
            Ucero(i,j)=Unuevo(i,j);
        end
    end

end
end

