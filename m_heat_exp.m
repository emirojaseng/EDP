function W = m_heat_exp(b, l, r, D, Ix, It, M, N)% In : b  ... function handle, initial condition b(x)%      l  ... function hanlde, left boundary condition l(t) DIRCHLET%      r  ... function hanlde, right boundary condition r(t) NEUMANN%      D  ... heat diffusion coefficient%      Ix ... space interval [a, b]%      It ... time interval [t0, t0 + T]%      M  ... number of space intervals (steps)%      N  ... number of time steps%% Out: W ... numerical solution%Resuelve con un metodo explicito la ecuacion del calor. Ejemplo:%W=m_heat_exp(@(x) exp(-x^2), @(t) exp(-4), @(t) exp(-4), 1, [-2,2], [0,4], 50, 1500);% W=m_heat_exp(@(x) cos(2*pi*x), @(t) exp(-4*t), @(t) 0, 1/pi^2, [0,1], [0,1], 100, 300);%inicializa W, cada donde W(:,i) es la solucion w(x) al tiempo iW=zeros(M+1,N+1);dx=(Ix(2)-Ix(1))/M; %paso xdt=(It(2)-It(1))/N; %paso tx=linspace(Ix(1),Ix(2),M+1);t=linspace(It(1),It(2),N+1);sigma=D^2*dt/(dx^2) %constante del esquema.%Primer tiempo:for i=1:M+1W(i,1)=b(x(i));end%proceso importantefor i=1:N  W(:,i+1)=paso_calor_exp(W(:,i),t(i), l, r, sigma,dx, M);end%Opcional: hace la grafica dentro de la funcionmesh(t, x, W, 'LineWidth',1.5);end function w_futuro=paso_calor_exp(w_presente,t,l, r, sigma, dx, M)  w_futuro=zeros(1,M+1);  w_futuro(1)=l(t); %frontera izquierda (DE DIRICHLET)    %frontera derecha (DE NEUMANN) w_fantasma=r(t)*2*dx+w_presente(M-1); %el que se sale de la frontera. Orden h^2 w_futuro(M+1)=sigma*(w_presente(M-1)-2*w_presente(M)+w_fantasma)+w_presente(M); %frontera  for i=2:M    %esquema    w_futuro(i)=sigma*(w_presente(i-1)-2*w_presente(i)+w_presente(i+1))+w_presente(i);  endend