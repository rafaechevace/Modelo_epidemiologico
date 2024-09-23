clc
clear all
%Rafael Echevarría Aceña%

%_____Hito 4_____%

figure(1);
foto4=imread("hitoo4.png");
imshow(foto4);

%################Parte 1####################

%Variables inciales dadas por el enunciado:
Tc=0.5; At=1; n=50; tam=n/At;

%Creo los vectores con su tamaño al tratarse también este hito de uno largo
%para mayor eficiencia del programa. Después los inicializo para obtener
%las ecuaciones dadas por el diagrama.
Ps=zeros(1,tam+1); Pe=zeros(1,tam+1); Pr=zeros(1,tam+1); I=zeros(1,tam+1); T=zeros(1,tam+1); Ti=zeros(1,tam+1);
T(1)=0; 
Ps(1)=1000; %Poblacion Susceptible
Pe(1)=0; %Población enferma
Pr(1)=Pe(1)/(Pe(1)+Ps(1)); %Prevalencia
Ti(1)=Tc*Pr(1); %Tasa de Incidencia
I(1)=Ti(1)*Ps(1); %Incidencia

%Utilizo un bucle for para calcular los vectores respecto al tiempo
t=1;
while t<=tam
    T(t+1)=T(t)+At;
    Ps(t+1)=Ps(t)-I(t);
    Pe(t+1)=Pe(t)+I(t);
    Pr(t+1)=Pe(t+1)/(Pe(t+1)+Ps(t+1));
    Ti(t+1)=Tc*Pr(t+1);
    I(t+1)=Ti(t+1)*Ps(t+1);
    t=t+1;
end

%Creo las gráficas dentro de una misma pestaña 
figure(2);
subplot(1,3,1);
comet(T,I);
title('Incidencia');
xlabel('tiempo en días');
ylabel('nuevos casos por persona');
grid on 
subplot(1,3,2);
plot(T,Pr,'-.sg');
title('Prevalencia');
xlabel('tiempo (dias)');
ylabel('enfermos');
grid on 
subplot(1,3,3);
plot(T,Ps,'-.<r',T,Pe,'-.>c');
title('Población susceptible y enferma');
xlabel('tiempo en días');
ylabel('numero de personas');
legend('Poblacion susceptible','Poblacion enferma');
grid on 

disp('Pe(t) sería siempre cero si Ti(t) depende de Pr(t), por lo que no tiene sentido --> #.');
%Al ser Pe(t)=0, también serían cero las ecuaciones que contienen esta
%variable como producto o división por lo que no tendría sentido.


%#######################Parte 2########################
disp('------------Parte2-----------');

%El usuario debe introducir por teclado la tasa de contagio (a prueba de
%error) 
Tc2=input('Introduzca una nueva tasa de contajio entre el 0 y 1: ');
while Tc2<0 || Tc2>1 %Bloquear valores erroneos 
    disp('Valor introducido no valido, intentelo de nuevo');
    Tc2=input('Inserte un valor de incidencia entre 0 y 1000: ');
end

%y tambien valores distintos a los del enunciado de población inicial y
%poblacion enferma inicial.
P0=input('Introduzca la población inicial: ');
Pei=input('Introduzca la poblacion enferma inicialmente: ');

%Creo e inicializo los vectores para crear las formulas de igual forma que
%en el apartado anterior.
Ps2=zeros(1,tam+1); Pe2=zeros(1,tam+1); Pr2=zeros(1,tam+1); I2=zeros(1,tam+1); Ti2=zeros(1,tam+1);
Ps2(1)=P0-Pei;
Pe2(1)=Pei;
Pr2(1)=Pe2(1)/(Pe2(1)+Ps2(1));
Ti2(1)=Tc2*Pr2(1);
I2(1)=Ti2(1)*Ps2(1);

%Utilizo un búcle for para calcular vectores respecto al tiempo de nuevo
t=1;
while t<=tam
    Ps2(t+1)=Ps2(t)-I2(t);
    Pe2(t+1)=Pe2(t)+I2(t);
    Pr2(t+1)=Pe2(t+1)/(Pe2(t+1)+Ps2(t+1));
    Ti2(t+1)=Tc2*Pr2(t+1);
    I2(t+1)=Tc2*Ps2(t+1);
    t=t+1;
end

%Creo las gráficas en una misma pestaña teniendo en cuenta diseños iguales
%para funciones iguales.
figure(3);
subplot(2,3,1);
comet(T,I);
title('Incidencia');
xlabel('tiempo en días');
ylabel('nuevos casos por persona');
grid on 
subplot(2,3,2);
comet(T,Pr);
title('Prevalencia');
xlabel('tiempo en días');
ylabel('enfermos');
grid on 
subplot(2,3,3);
plot(T,Ps,'-.<r',T,Pe,'-.>c');
title('Población susceptible y enferma');
xlabel('tiempo en días');
ylabel('numero de personas');
legend('Pobl. susceptible','Pobl. enferma');
grid on 

subplot(2,3,4);
comet(T,I2);
title('Incidencia');
xlabel('tiempo en días');
ylabel('nuevos casos por persona');
grid on 
subplot(2,3,5);
comet(T,Pr2);
title('Prevalencia');
xlabel('tiempo en días');
ylabel('enfermos');
grid on 
subplot(2,3,6);
plot(T,Ps2,'-.<r',T,Pe2,'-.>c');
title('Población susceptible y enferma');
xlabel('tiempo en días');
ylabel('numero de personas');
legend('Pobl. susceptible','Pobl. enferma');
grid on 

%#######################Parte 3########################
disp('-----------Parte 3-----------');

%Inicializo y creo los vectores de igual forma que en los apartados
%anteriores
Ps3=zeros(1,tam+1); Pe3=zeros(1,tam+1); Pr3=zeros(1,tam+1); I3=zeros(1,tam+1); Ti3=zeros(1,tam+1);
Ps3(1)=999;
Pe3(1)=1;
Pr3(1)=Pe3(1)/(Pe3(1)+Ps3(1));
Ti3(1)=Tc*Pr3(1);
I3(1)=Ti3(1)*Ps3(1);

%En este caso en vez de utilizar un bucle for utilizo uno while para no ser
%repetitivo.
t=1;
while t<=tam
    Ps3(t+1)=Ps3(t)-I3(t);
    Pe3(t+1)=Pe3(t)+I3(t);
    Pr3(t+1)=Pe3(t+1)/(Pe3(t+1)+Ps3(t+1));
    Ti3(t+1)=Tc*Pr3(t+1);
    I3(t+1)=Ti3(t+1)*Ps3(t+1);
    t=t+1;
end

%Para obtener el dia con la mayor incidencia utilizo un bucle for para
%elevar el valor de i y un if para elevar el valor de max hasta que las
%posiciones de ambos valores en el vector se encuentren seguidas, siendo
%esa posicion el mayor valor de la incidencia.
max=1;
for i=2:tam+1
if I3(max)<I3(i)
    max=i;
    end
end 

disp('El dia con la mayor incidencia se proudce el: ');
disp(T(max)); %Mostrar el valor del vector tiempo en la posición max.

%De igual forma uso un bucle while para obtener el valor de i en el que la
%prevalencia alcanza el 90%.
i=1;
while Pr3(i)<=0.9
    i=i+1;
end

%Así, el valor del vector tiempo en I sera el dia en el que la prevalencia
%se sobrepase. 
disp('La prevalencia sobrepasa el 90% el día: ');
disp(T(i));

%Creo las gráficas en una misma pestaña nueva:
figure(4);
subplot(1,2,1);
comet(T,I3);
title('Incidencia');
xlabel('tiempo en dias');
ylabel('nuevos casos');
grid on
subplot(1,2,2);
comet(T,Pr3);
title('Prevalencia');
xlabel('tiempo en dias');
ylabel('enfermos');
grid on