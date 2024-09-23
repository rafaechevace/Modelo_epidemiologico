clc
clear all
%Rafael Echevarría Aceña%

%%% ____________ HITO 1 ____________ %% 
% En esta parte se carga la imagen de la figura y se muestra en una ventana
% aparte. 

figure(1);
foto = imread("hitoo1.png"); 
imshow(foto); 

% ########################## Parte 1 ##################################
% Esta sección define las variables iniciales para el problema e
% inicializa los vectores que se utilizarán para el cálculo posterior.

% Defino las variables iniciales según los valores dados en el enunciado
Nd = 0.25; % Agua deseada
k = 0.1; % Constante
At = 0.1; % Variación del tiempo
T = 25; % Tiempo total

% Inicializacio los vectores o ecuaciones primarias para su posterior
% uso
t(1) = 0; % Vector t: tiempo
N(1) = 0; % Vector N: Agua en el vaso
D(1) = Nd - N(1); % Vector D: Discrepancia
F(1) = k*D(1); % Vector F: Flujo chorro grifo
partes = T / At; % Cantidad de partes a evaluar

% Mediante el bucle for se dan valores a cada posición i de los vectores
% hasta llegar a la cantidad de partes, determinada por la división entre el
% tiempo total y la variación de tiempo, cuyo resultado será la cantidad de
% posiciones totales que necesitamos.
for i = 1:partes
    t(i+1) = t(i) + At; % Actualización del tiempo
    N(i+1) = N(i) + F(i) * At; % Actualización del agua en el vaso
    D(i+1) = Nd - N(i+1); % Actualización de la discrepancia
    F(i+1) = k * D(i+1); % Actualización del flujo
end

% Por último, se crean las gráficas necesarias para su representación en
% pestañas distintas mediante figure y comet, que representa la gráfica con
% una animación.

% Gráfica del flujo en función del tiempo
figure(2);
comet(t, F); % Utilizo comet para representar la animación en lugar de plot
title('Flujo/tiempo');
ylabel('Flujo(l/s)');
xlabel('tiempo(s)');
grid on; % He añadido la cuadrícula para simplificar la visualización

% Grafica del agua en el vaso en función del tiempo
figure(3);
comet(t, N); % Utilizo comet para representar la animacion en lugar de plot
title('Agua/tiempo');
ylabel('Agua(l)');
xlabel('tiempo(s)');
grid on; % Se añade cuadrícula para simplificar la visualización

% En ambas gráficas se han utilizado diseños distintos para su mejor
% diferenciación, en la primera una línea roja y en la segunda una línea
% azul.


% ############################## Parte 2 ##################################
% En esta sección se calcula la cantidad de agua en el vaso en un momento
% determinado y se muestra en pantalla.


disp('-------Parte 2-------');

%La cantidad de agua en el vaso en dicho momento provendría del vector N en
%la posición equivalente a t=10 entre la variación del tiempo más uno, esto 
% es así ya que para representar 2 posiciones hacen falta tres puntos: inicial, 
% medio y final. Este razonamiento se aplica a cualquier posicion del vector.

%Muestro la cantidad 1 por pantalla
disp('La cantidad de agua en el vaso cuando t=10 será igual a: ');
cantidad=10/At+1; 
disp(N(cantidad)); 

%Muestro la cantidad 2 por pantalla
disp('La cantidad de agua en el vaso cuando t=20 es : ');
cantidad2=20/At+1; 
disp(N(cantidad2)); 


% En segundo lugar mediante un bucle while cuando F en cont sea mayor que
% 0.01 hago que cont aumente hasta el punto en el que al añadir un valor
% mas sobrepase 0.01, siendo entonces este valor la cantidad de agua maxima
% justo antes de que el flujo valga 0.01.

cont=1;
%___Utilizo un bucle while___%
while F(cont)>0.01
    cont=cont+1;
end

% Muestro el resultado por pantalla
disp('La cantidad de agua en el vaso cuando el flujo es menor que 0.01 es: ');
disp(t(cont));
