clc
clear all

%Rafael Echevarría Aceña%

%% Hito 2 %%

%La función de este código es la de crear una simulación de una enfermedad
%infecciosa que se propaga en una población a lo largo del tiempo, siguiendo
%las ecuaciones y valores proporcionados por el enunciado.

%Para comenzar, se muestra una imagen mediante la función imread y imshow.

figure(1);
foto2=imread("hitoo2.png");
imshow(foto2);

%########################Parte 1###############################

%Primero se crean las variables que van a ser constantes durante toda la
%simulación, siguiendo las especificaciones del enunciado.
Vi=50;
At=1;
n=50;
tam=n/At;

%Se inicializan los vectores principales, Ps, Pe, Pr, I y T, dándoles un tamaño
%conocido previamente para evitar ineficiencias. Luego, se les asignan valores
%iniciales para obtener las ecuaciones correspondientes.
Ps=zeros(1,tam+1); Pe=zeros(1,tam+1); Pr=zeros(1,tam+1);
I=zeros(1,tam+1); T=zeros(1,tam+1);
T(1)=0;
Ps(1)=1000; %Población susceptible
Pe(1)=0; %Poblacion enferma
I(1)=min(Vi,Ps(1)/At); %Incidencia
Pr(1)=Pe(1)/(Pe(1)+Ps(1)); %Prevalencia

%Se utiliza un bucle for para calcular los vectores para cada t desde 1 hasta tam,
%tal y como se realizó en el hito 1, ya que es el método más sencillo y eficiente.
for t=1:tam
T(t+1)=T(t)+At;
Ps(t+1)=Ps(t)-I(t);
Pe(t+1)=Pe(t)+I(t);
I(t+1)=min(Vi,Ps(t+1)/At);
Pr(t+1)=Pe(t+1)/(Pe(t+1)+Ps(t+1));
end

%Se generan las gráficas de incidencia, prevalencia y población susceptible
%y enferma mediante comet y plot. Para diferenciar las gráficas de cada parte
%del ejercicio, se muestran todas juntas en una misma ventana mediante subplot.
figure(2);

subplot(1,3,1);
comet(T,I);
title('Incidencia');
xlabel('dias');
ylabel('persona');
grid on

subplot(1,3,2);
comet(T,Pr);
title('Prevalencia');
xlabel('dias');
ylabel('enfermos');
grid on

subplot(1,3,3);
plot(T,Ps,'-xb',T,Pe,'-+k');
title('Población susceptible y enferma')
xlabel('dias');
ylabel('numero de personas');
legend('Población susceptible','Población enferma');
grid on


%##############################_Parte2_##############################

% En la parte 2 se le pide al usuario que introduzca los valores de incidencia de la enfermedad para dos grupos diferentes.

disp('---------Parte 2---------');

% Lo primero es pedir al usuario los valores de incidencia. Para asegurarse de que se introduzcan valores correctos, se utiliza un bucle while.

a=zeros(1,2); % Inicializar vector dándole un tamaño
auxiliar=input('Inserte un valor de incidencia entre 0 y 50: ');
while auxiliar<0 || auxiliar>50 % Bloquear valores erroneos 
    disp('Valor introducido no valido, intentelo de nuevo');
    auxiliar=input('Inserte un valor de incidencia entre 0 y 50: ');
end
a(1)=auxiliar; % Doy al vector a en la posicion uno el valor introducido por el usuario

% Continuo inicializando y dando valores a los vectores para obtener las ecuaciones correspondientes.
Ps1=zeros(1,tam+1); Pe1=zeros(1,tam+1); Pr1=zeros(1,tam+1); I1=zeros(1,tam+1); 
Ps1(1)=1000; Pe1(1)=0;
I1(1)=min(a(1), Ps1(1)/At);
Pr1(1)=Pe1(1)/(Pe1(1)+Ps1(1));

% Para calcular los vectores utilizo un bucle while cuyo funcionamiento es el mismo que el for utilizado en la Parte 1.
% Realiza el calculo en cada posicion de t hasta que t es igual a tam.

t=1;
while t<=tam
    Ps1(t+1)=Ps1(t)-I1(t);
    Pe1(t+1)=Pe1(t)+I1(t);
    I1(t+1)=min(a(1),Ps1(t+1)/At);
    Pr1(t+1)=Pe1(t+1)/(Pe1(t+1)+Ps1(t+1));
    t= t+1;
end

% Sigo el mismo procedimiento anterior para introducir el valor por teclado para el segundo grupo.
auxiliar2=input('Inserte un valor de incidencia mayor que 50: ');
while auxiliar2<=50 
    disp('Valor introducido no valido, intentelo de nuevo: ');
    auxiliar2=input('Inserte un valor de incidencia mayor que 50: ');
end
a(2)=auxiliar2; 

% Para la segunda parte utilizo el mismo procedimiento anterior,
% incializando los vectores y obteniendo las ecuaciones, esta vez con a2 en vez de a.
Ps2=zeros(1,tam+1); Pe2=zeros(1,tam+1); Pr2=zeros(1,tam+1); I2=zeros(1,tam+1);
Ps2(1)=1000;
Pe2(1)=0;
I2(1)=min(a(2),Ps2(1)/At);
Pr2(1)=Pe2(1)/(Pe2(1)+Ps2(1));

%Vuelvo a emplear un while para el calculo de los vectores, la unica
%diferencia es que a ahora es igual a a2.
t=1;
while t<=tam
    Ps2(t+1)=Ps2(t)-I2(t);
    Pe2(t+1)=Pe2(t)+I2(t);
    I2(t+1)=min(a(2),Ps2(t+1)/At);
    Pr2(t+1)=Pe2(t+1)/(Pe2(t+1)+Ps2(t+1));
    t=t+1;
end

%Creo las gráficas teniando en cuenta que se repiten las funciones a representar pero con valores distintos, 
%por lo que utilizo igual diseño entre las mismas funciones para una mayor simplificación.
%Represento mediante comet las graficas simples, las compuestas mediante
%subplot ya que tienen dos funciones.

figure(3);
subplot(3,3,2);
comet(T,I);
title('Incidencia');
ylabel('nuevos casos(personas)');
xlabel('tiempo(días)');
grid on

subplot(3,3,3);
comet(T,Pr);
title('Prevalencia');
xlabel('tiempo(dias)');
ylabel('enfermos');
grid on

subplot(3,3,1);
plot(T,Ps,'-xb',T,Pe,'-+k');
title('Poblacion susceptible y enferma');
ylabel('numero de personas');
xlabel('tiempo(días)');
legend('Población susceptible','Población enferma');
grid on

subplot(3,3,5);
comet(T,I1);
title('Incidencia');
xlabel('tiempo(días)');
ylabel('nuevos casos(personas)');
grid on
subplot(3,3,6);
comet(T,Pr1);
title('Prevalencia');
xlabel('tiempo(dias)');
ylabel('enfermos');
grid on

subplot(3,3,4)
plot(T,Ps1,'-xb',T,Pe1,'-+k');
title('Poblacion susceptible y enferma');
xlabel('tiempo(dias)');
ylabel('numero de personas');
legend('Población susceptible','Población enferma');
grid on

subplot(3,3,8);
comet(T,I2);
title('Incidencia');
ylabel('nuevos casos(personas)');
xlabel('tiempo(días)');
grid on

subplot(3,3,9);
comet(T,Pr2);
title('Prevalencia');
ylabel('enfermos');
xlabel('tiempo(dias)');
grid on

subplot(3,3,7)
plot(T,Ps2,'-xb',T,Pe2,'-+k');
title('Poblacion susceptible y enferma');
ylabel('numero de personas');
xlabel('tiempo(dias)');
legend('Población susceptible','Población enferma');
grid on


%#######################_Parte 3_############################

disp('---------Parte 3-------');

%Copiando el procedimiento de la parte 2 se introduce b mediante teclado a
%prueba de errores.
b=input('Inserte un numero inicial de enfermos entre 0 y 1000 para t=0: ');
while b<0 || b>1000 %Bloquear valores erroneos 
    disp('Valor introducido no valido, intentelo de nuevo');
    b=input('Inserte un valor de incidencia entre 0 y 1000: ');
end

%Inicializo los vectores con su tamaño y les doy sus primeros valores para
%crear las ecuaciones:
Pse=zeros(1,tam+1); Pee=zeros(1,tam+1); Pre=zeros(1,tam+1); Ie=zeros(1,tam+1);

Pse(1)=1000-b;
Pee(1)=b;
Ie=min(Vi,Pse(1)/At);
Pre(1)=Pee(1)/(Pee(1)+Pse(1));

%Utilizo el mismo bucle while que en los apartados anteriores:
t=1;
while t<=tam
    Pse(t+1)=Pse(t)-Ie(t);
    Pee(t+1)=Pee(t)+Ie(t);
    Ie(t+1)=min(Vi,Pse(t+1)/At);
    Pre(t+1)=Pee(t+1)/(Pee(t+1)+Pse(t+1));
    t=t+1;
end

%Diseño las gráficas de igual forma, con diseños iguales entre funciones
%iguales:
figure(4);

subplot(2,3,1);
comet(T,I);
title('Incidencia');
xlabel('tiempo(días)');
ylabel('nuevos casos(personas)');
grid on
subplot(2,3,2);
comet(T,Pr);
title('Prevalencia');
xlabel('tiempo(dias)');
ylabel('enfermos');
grid on
subplot(2,3,3);
plot(T,Ps,'-xb',T,Pe,'-+k');
title('Poblacion susceptible y enferma');
xlabel('tiempo(dias)');
ylabel('numero de personas');
legend('Población susceptible','Población enferma');
grid on

subplot(2,3,4);
comet(T,Ie);
title('Incidencia');
ylabel('nuevos casos(personas)');
xlabel('tiempo(días)');
grid on
subplot(2,3,5);
comet(T,Pre);
title('Prevalencia');
ylabel('enfermos');
xlabel('tiempo(dias)');
grid on
subplot(2,3,6)
plot(T,Pse,'-xb',T,Pee,'-+k');
title('Poblacion susceptible y enferma');
ylabel('numero de personas');
xlabel('tiempo(dias)');
legend('Población susceptible','Población enferma');
grid on



