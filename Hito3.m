clc
clear all
%Rafael Echevarria Aceña%

% Hito 3 %

% El hito tres se divide en tres partes principales: definición de variables y parámetros iniciales, cálculo de vectores utilizando un bucle for y creación de gráficas,
% y cálculo de un límite utilizando un bucle while.

% ####################### Parte 1 #############################

% Esta primera parte define los valores dados por el enunciado del problema.
% Ti es la tasa de transmisión, At el intervalo de tiempo entre cada cálculo, n el número total de días y tam el tamaño del vector.
% Además, se crean los vectores iniciales con su tamaño correspondiente para maximizar la eficiencia.

disp('-------Parte 1-------');
Ti = 0.1;
At = 1;
n = 50;
tam = n/At;

Ps = zeros(1,tam+1); % Población susceptible
Pe = zeros(1,tam+1); % Población enferma
Pr = zeros(1,tam+1); % Población recuperada
I = zeros(1,tam+1); % Incidencia
T(1) = 0; % Tiempo inicial

Ps(1) = 1000; % Población susceptible inicial
Pe(1) = 0; % Población enferma inicial
I(1) = Ti*Ps(1); % Incidencia inicial
Pr(1) = Pe(1)/(Pe(1)+Ps(1)); % Prevalencia inicial

% Se utiliza un bucle for para calcular los vectores correspondientes a cada día.
% El valor de cada vector en cada día se actualiza utilizando las fórmulas proporcionadas por el enunciado.
% Se actualiza también el valor de T para cada día.

for t = 1:tam
T(t+1) = T(t) + At;
Ps(t+1) = Ps(t) - I(t);
Pe(t+1) = Pe(t) + I(t);
I(t+1) = Ti*Ps(t+1);
Pr(t+1) = Pe(t+1)/(Pe(t+1)+Ps(t+1));
end

% Finalmente, se crean las gráficas correspondientes utilizando las funciones "comet" y "plot".
% Se utiliza un subplot para mostrar tres gráficas distintas: Incidencia, Prevalencia y Población susceptible y enferma.

figure(1);
subplot(1,3,1);
comet(T,I);
title('Incidencia');
xlabel('días');
ylabel('nuevos casos');
grid on
subplot(1,3,2);
comet(T,Pr);
title('Prevalencia');
xlabel('dias');
ylabel('enfermos');
grid on
subplot(1,3,3);
plot(T,Ps,'--pr',T,Pe,'--hc');
title('Poblacion susceptible y enferma');
xlabel('dias');
ylabel('numero de personas');
legend('Pbl. susceptible','Pbl. enferma');
grid on


%___Utilizo un bucle while para calcular hasta un límite___%
i=1;
while Ps(i)>Pe(i)
    i=i+1;
end

%Para calcular el día en el que personas susceptibles y enfermas tendrán el
%mismo valor imprimo el valor del vector I (Incidencia) en la posicion i-1
disp('El numero de personas susceptibles y enfermas será igual el día: ');
disp(I(i-1));

%##########################Parte 2#####################################
disp('----------Parte 2---------');

%Lo primero es que el usuario introduzca el valor de incidencia por
%teclado, igual que anteriormente, a prueba de errores.
tinc=input('Introduzca una tasa de incidencia entre 0 y 1: ');
while tinc<0 || tinc>1 %Bloquear valores erroneos 
    disp('Valor introducido no valido, intentelo de nuevo');
    tinc=input('Inserte un valor de incidencia entre 0 y 1000: ');
end

%Inicializo los vectores para obtener las ecuaciones del ejercicio, igual
%que en la primera parte pero con una tasa de incidencia distinta "tinc"
% introducida por teclado.
Pst=zeros(1,tam+1); Pet=zeros(1,tam+1); Prt=zeros(1,tam+1); It=zeros(1,tam+1);
Pst(1)=1000;
Pet(1)=0;
It(1)=tinc*Pst(1);
Prt(1)=Pet(1)/(Pet(1)+Pst(1));

%___Utilizo un bucle for para calcular los vectores___%
for t=1:tam
    Pst(t+1)=Pst(t)-It(t);
    Pet(t+1)=Pet(t)+It(t);
    It(t+1)=tinc*Pst(t+1);
    Prt(t+1)=Pet(t+1)/(Pet(t+1)+Pst(t+1));
end

%Genero las gráficas en una pestaña aparte, con diseños coincidentes entre
%mismas funciones.
figure(2);
subplot(2,3,6);
comet(T,I);
title('Incidencia');
xlabel('dias');
ylabel('nuevos casos');
grid on
subplot(2,3,5);
comet(T,Pr);
title('Prevalencia');
xlabel('dias');
ylabel('enfermos');
grid on
subplot (2,3,4);
plot(T,Ps,'--pr',T,Pe,'--hc');
title('Población susceptible y enferma');
xlabel('dias');
ylabel('numero de personas');
legend('Pbl.susceptible', 'Pbl. enferma');
grid on

subplot(2,3,3);
comet(T,It);
title('Incidencia');
xlabel('dias');
ylabel('nuevos casos');
grid on
subplot(2,3,2);
comet(T,Prt);
title('Prevalencia');
xlabel('dias');
ylabel('enfermos');
grid on
subplot(2,3,1);
plot(T,Pst,'--pr',T,Pet,'--hc');
title('Población susceptible y enferma');
xlabel('dias');
ylabel('numero de personas');
legend('Pobl. susceptible','Pobl. enferma');
grid on

%##########################Parte 3####################################
disp('-------Parte 3--------');

%El usuario introduce por teclado el valor de enfermos inicial, controlando
%que no se puedan introducir datos erroneos.
enf=input('Introduzca el número de enfermos iniciales: ');
while enf<0  %Bloquear valores erroneos 
    disp('Valor introducido no valido, intentelo de nuevo');
    enf=input('Inserte un valor de incidencia entre 0 y 1000: ');
end

%Inicializo los vectores para obtener las ecuaciones igual que en los hitos
%anteriores, la unica diferencia es que el valor de enfermos inicial "enf"
%se introduce por teclado.
Pse=zeros(1,tam+1); Pee=zeros(1,tam+1); Pre=zeros(1,tam+1); Ie=zeros(1,tam+1);
Pse(1)=1000-enf;
Pee(1)=enf;
Ie(1)=Ti*Pse(1);
Pre(1)=Pee(1)/(Pe(1)+Pse(1));

%Utilizo otro bucle for para calcular los vectores
for t=1:tam
    Pse(t+1)=Pse(t)-Ie(t);
    Pee(t+1)=Pee(t)+Ie(t);
    Ie(t+1)=Ti*Pse(t+1);
    Pre(t+1)=Pee(t+1)/(Pee(t+1)+Pse(t+1));
end

%Genero las gráficas de igual forma en una pestaña distinta:

figure(3);
subplot(2,3,1);
comet(T,I);
title('Incidencia');
xlabel('tiempo(dias)');
ylabel('nuevos casos(persona)');
grid on
subplot(2,3,2);
comet(T,Pr);
title('Prevalencia');
xlabel('dias');
ylabel('enfermos');
grid on
subplot(2,3,3);
plot(T,Ps,'--pr', T, Pe, '--hc');
title('Población susceptible y enferma');
xlabel('dias');
ylabel('numero de personas');
legend('Pobl. susceptible','Pobl. enferma');
grid on
subplot(2,3,4);
comet(T,Ie);
title('Incidencia');
xlabel('dias');
ylabel('nuevos casos');
grid on
subplot(2,3,5);
comet(T,Pre);
title('Prevalencia');
xlabel('dias');
ylabel('enfermos');
grid on
subplot(2,3,6);
plot(T,Pse,'--pr',T,Pee,'--hc');
xlabel('dias');
ylabel('numero de personas');
grid on





