function FwTFwS(xmin, xmax, t0, T, h, k, c, u0)
U0=@(x) max(1-abs(x), 0); % La funcion
x=xmin:h:xmax; 
t=t0:k:T;
hintervalos=ceil((xmax-xmin)/h)+1;
tintervalos=ceil((T-t0)/k)+1;
nuevo=zeros(1,hintervalos)+1;

%Setupea u(x,0)=viejo
for i=1:hintervalos
viejo(i)=U0(x(i));
end
%Este es el plot
plot(x,viejo);
disp('ok');
%Éste va a ser el verdadero proceso
for j=1:tintervalos
    for i=1:hintervalos-j
    nuevo(i)=-c*(k/h)*(viejo(i+1)-viejo(i))+viejo(i);
    end
plot(x(1:hintervalos),nuevo);
pause(2);
    for i=1:hintervalos-j
    viejo(i)=nuevo(i);
    end
end
end

