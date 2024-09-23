clc 
clear all
%Rafael Echevarría Aceña%

%______Hito 5_____%

figure(1);
foto5=imread("hitoo5.png");
imshow(foto5);

%########################Parte 1########################
% Cu(t+1)=Pe(t)                  Vector curación
% Mu(t)=Tl*Pe(t)                 Vector muertes
% Pre(t)=Pe(t)/(Pe(t)+Ps(t))     Vector prevalencia
% Tin(t)=Tc*Pr(t)                Vector de la tasa de Incidencia
% Inc(t)=Ti(t)*Ps(t)             Vector de la incidencia
% Ps'=-I(t)+C(t)                 Vector variación de la poblacion susceptible
% Ps(t+1)=Ps(t)-I(t)+C(t)        Vector de la poblacion susceptible
% Pe'(t)=I(t)-C(t)-M(t)          Vector variación de la poblacion enferma
% Pen(t+1)=Pe(t)*I(t)-C(t)-M(t)  Vector de la poblacion enferma


%#########################Parte 2##########################

%Variables iniciales dadas por el enunciado
Tc=0.5; Dm=4; Tl=0; n=50; per=ceil(n/Dm);

%Inicializo los vectores para obtener las ecuaciones dadas por el
%ejercicio.
Pen(1)=10;
Ps(1)=1000-Pen(1);
T(1)=0;
Pre(1)=Pen(1)/(Pen(1)+Ps(1));
Tin(1)=Tc*Pre(1);
Inc(1)=Tin(1)*Ps(1);
Cu(1)=0;
Mu(1)=Pen(1)*Tl;

%Utilizo un bucle for para iterar sobre los vectores 
for t=1:per-1
    T(t+1)=T(t)+Dm;
    Ps(t+1)=Ps(t)- Inc(t)+Cu(t);
    Pen(t+1)=Pen(t)+Inc(t)-Cu(t)+Mu(t);
    Pre(t+1)=Pen(t+1)/(Pen(t+1)+Ps(t+1));
    Tin(t+1)=Tc*Pre(t+1);
    Inc(t+1)=Tin(t+1)*Ps(t+1);
    Cu(t+1)=Pen(t);
    Mu(t+1)=Pen(t+1)*Tl;
end

%Creo las graficas en pestañas distintas para una mayor visibilidad 
% al tratarse de un hito corto.
figure(2);
plot(T,Ps,':*m',T,Pen,':db');
title('Población susceptible y enferma');
xlabel('tiempo en dias');
ylabel('numero de personas');
grid on
figure(3);
plot(T,Cu,':db',T,Inc,':xg');
title('Curación e incidencia');
xlabel('tiempo en dias');
ylabel('numero de personas');
legend('Curadas','Incidencia');
grid on
figure(4);
plot(T,Pre,':sr');
title('Prevalencia');
xlabel('tiempo en días');
ylabel('enfermos');
grid on
