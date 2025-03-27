# 📊 Proyecto de Modelado Epidemiológico

Este proyecto es una implementación de **modelos de simulación determinista** para el análisis de **sistemas dinámicos**, enfocados en la propagación de enfermedades. Basado en principios de **álgebra** y **teoría de grafos**, está implementado en **MATLAB** para simular y visualizar la evolución de poblaciones en diferentes escenarios epidemiológicos.

---

## 🎯 Objetivo del Proyecto

El objetivo principal es **modelar y simular** diferentes escenarios de propagación de enfermedades a través de **modelos epidemiológicos básicos**. A través de estos modelos, se observa cómo las **poblaciones susceptibles** y **enfermas** evolucionan bajo diversas condiciones, explorando aspectos clave como:

- La incidencia constante.
- La tasa de contagio.
- La recuperación y fallecimiento dentro de la población.

---

## 🧩 Modelos Implementados

El proyecto está dividido en varios **modelos de simulación**, cada uno con su propio enfoque y parámetros específicos:

### 🔹 Modelo de Incidencia Constante
Simula la evolución de la enfermedad en una población bajo la suposición de que un número constante de nuevos casos se diagnostican en cada unidad de tiempo.

### 🔹 Modelo de Tasa de Incidencia Constante
Aquí, la incidencia depende del número de personas susceptibles, haciendo que el modelo sea más realista en comparación con la incidencia constante.

### 🔹 Modelo de Tasa de Contagio Constante
En este modelo, la **tasa de contagio** varía proporcionalmente con la prevalencia de la enfermedad, reflejando una mayor probabilidad de infección cuando hay más personas enfermas.

### 🔹 Modelo con Recuperación y Fallecimiento
Este modelo añade un componente adicional al simular la **recuperación** y el **fallecimiento** dentro de la población enferma, con la posibilidad de reinfección.

---

## ⚙️ Ejecución de las Simulaciones

El proyecto contiene varios archivos `.m`, cada uno asociado a un **hito** del proyecto y enfocado en simular diferentes aspectos de la propagación de enfermedades. Estos archivos generan datos y gráficos basados en los modelos descritos.

### Archivos de Datos
Cada archivo de datos es generado durante la simulación y contiene los resultados en formato de vectores y matrices que representan las poblaciones y variables relevantes a lo largo del tiempo.

- **hito1_datos.mat**: Almacena los resultados de la simulación del Hito 1 (Incidencia Constante), incluyendo los valores de la población susceptible, enferma, y el flujo de incidencia.
- **hito2_datos.mat**: Resultados del Hito 2 (Tasa de Incidencia Constante), con las mismas variables que el Hito 1, pero ajustadas según el nuevo modelo.
- **hito3_datos.mat**: Contiene los datos de la simulación del Hito 3 (Tasa de Contagio Constante), incluyendo la prevalencia y los flujos de incidencia según la tasa de contagio.
- **hito4_datos.mat**: Resultados de la simulación del Hito 4 (Recuperación y Fallecimiento), con flujos adicionales como la tasa de curación y mortalidad.

### Instrucciones para Ejecutar Cada Hito

#### 🔹 Hito 1: Modelo de Incidencia Constante
- **Archivo**: `hito1.m`
- **Descripción**: Simula la evolución de una enfermedad bajo la hipótesis de que la incidencia (nuevos casos por unidad de tiempo) es constante. El archivo genera gráficos que muestran la evolución de la **población susceptible**, **población enferma** y la **incidencia**.
- **Datos generados**: Se almacena en `hito1_datos.mat`.

#### 🔹 Hito 2: Modelo de Tasa de Incidencia Constante
- **Archivo**: `hito2.m`
- **Descripción**: Modifica el modelo del Hito 1 para que la incidencia dependa de la cantidad de personas susceptibles. Aquí, la **tasa de incidencia** no es constante y cambia según la población susceptible disponible.
- **Datos generados**: Se guarda en `hito2_datos.mat`.

#### 🔹 Hito 3: Modelo de Tasa de Contagio Constante
- **Archivo**: `hito3.m`
- **Descripción**: Introduce la **tasa de contagio** como una variable clave, donde la probabilidad de contagio es proporcional a la prevalencia de la enfermedad. El archivo genera gráficos mostrando la **incidencia**, **prevalencia**, y la evolución de la **población susceptible y enferma**.
- **Datos generados**: Resultados almacenados en `hito3_datos.mat`.

#### 🔹 Hito 4: Modelo con Recuperación y Fallecimiento
- **Archivo**: `hito4.m`
- **Descripción**: Amplía el modelo del Hito 3 para incluir la **recuperación** y **fallecimiento** de la población enferma, además de la posibilidad de reinfección. Este modelo es más completo y simula escenarios más realistas de propagación.
- **Datos generados**: Se guardan en `hito4_datos.mat`.


## 📊 Visualización de Resultados

Cada simulación genera gráficos que ilustran visualmente la evolución de las variables clave a lo largo del tiempo:

- **Población Susceptible vs Población Enferma**.
- **Incidencia y Prevalencia** a lo largo del tiempo.
- **Flujos de contagio, recuperación y fallecimiento** en modelos avanzados.

Los gráficos permiten comprender de forma clara y visual cómo cambia la población a medida que la enfermedad se propaga, las personas se recuperan o fallecen, y cómo las diferentes estrategias de modelado afectan estos resultados.

---

## 🚀 Instalación

Sigue estos pasos para instalar y ejecutar el proyecto en tu máquina local:

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tuusuario/proyecto-simulacion.git
   ```
2. Abre los archivos `.m` en **MATLAB**.
3. Corre las simulaciones ajustando los parámetros según los experimentos que desees realizar.
