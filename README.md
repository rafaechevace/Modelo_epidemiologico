# 🧠 Proyecto de Visualización de la Estructura de Grupos de Investigación

Este proyecto implementa modelos de **análisis de grafos** utilizando **MATLAB**, con el objetivo de representar y analizar las colaboraciones entre investigadores de la Universidad de Castilla-La Mancha (UCLM). A partir de datos bibliográficos de la plataforma **Scopus**, se construye y analiza un grafo que representa las conexiones entre investigadores, permitiendo identificar grupos de investigación y su estructura interna.

---

## 🎯 Objetivo del Proyecto

El objetivo es **visualizar la estructura** de los **grupos de investigación** de la UCLM mediante el análisis de grafos, basándonos en colaboraciones entre autores. Esto incluye la construcción de un grafo de colaboración, la determinación de subgrupos (grupos de investigación), y la identificación de investigadores clave dentro de estos grupos.

A través de la práctica, se buscan patrones en las colaboraciones y se generan representaciones visuales que permitan un análisis más claro de la **dinámica de los grupos**.

---

## 🧩 Modelos Implementados

El proyecto está organizado en **hitos** que representan diferentes aspectos del análisis de los datos de colaboración:

### 🔹 Hito 1: Construcción del Grafo de Colaboración
En este hito se construye un grafo no dirigido, donde los vértices representan autores y las aristas representan colaboraciones entre ellos. El **peso de las aristas** se basa en la intensidad de colaboración (ajustada por el número de coautores). La representación gráfica del grafo se genera utilizando diferentes configuraciones de visualización en MATLAB.

### 🔹 Hito 2: Determinación de Grupos de Investigación
Se identifican automáticamente los **grupos de investigación** dentro del grafo eliminando aristas de baja intensidad. Se busca el **umbral α** óptimo para dividir el grafo en componentes conexas, donde cada componente corresponde a un grupo de investigación. Se eliminan los grupos con menos de 5 miembros.

### 🔹 Hito 3: Visualización de los Grupos de Investigación
Se generan representaciones gráficas separadas para cada grupo de investigación identificado, ajustando el grosor de las aristas en función de la intensidad de colaboración.

### 🔹 Hito 4: Identificación del Investigador Principal (IP)
Se calcula un índice de **productividad científica** para cada miembro del grupo basado en el peso de las aristas incidentes. El investigador con mayor índice es identificado como el **Investigador Principal (IP)**. Además, se genera un **árbol de colaboración** que maximiza la intensidad de las relaciones dentro del grupo.

### 🔹 Hito 5: Representación de la Estructura del Grupo
En este hito, se genera una visualización en forma de **árbol jerárquico** donde el IP es la raíz, y los demás miembros del grupo se posicionan en función de la intensidad de su colaboración. Se identifican posibles **subgrupos** dentro del equipo de investigación.

---

## ⚙️ Ejecución de las Simulaciones

El proyecto consta de varios archivos `.m` que corresponden a los hitos definidos anteriormente. A continuación se describe cada archivo y los datos que maneja:

### Archivos de Datos

Los datos necesarios para las simulaciones están proporcionados en la carpeta `Data/`:

- **1_authors.csv**: Contiene la información de los autores de la UCLM y su afiliación.
- **2_publications.csv**: Detalles de las publicaciones de los investigadores, aunque no es necesario para resolver esta práctica.
- **3_collaborations.csv**: Registra las colaboraciones entre pares de autores, necesarias para construir el grafo.

### Archivos de Ejecución

1. **Hito 1 - Construcción del Grafo**:
   - **Archivo**: `Milestone1.m`
   - **Descripción**: Carga los datos de colaboración, construye el grafo de colaboración entre los autores y genera una visualización gráfica de este.
   - **Datos generados**: `hito1_datos.mat`, contiene la representación del grafo con pesos.

2. **Hito 2 - Grupos de Investigación**:
   - **Archivo**: `Milestone2.m`
   - **Descripción**: Elimina aristas de baja intensidad para determinar los grupos de investigación. Calcula el valor óptimo de **α** y crea subgrafos para cada grupo. Los resultados se guardan en un `cell array` con los grafos generados.
   - **Datos generados**: `hito2_grupos.mat`, contiene los grafos de los grupos de investigación.

3. **Hito 3 - Visualización de Grupos**:
   - **Archivo**: `Milestone3.m`
   - **Descripción**: Carga los grafos de grupos desde el archivo generado en el hito anterior y los representa gráficamente en ventanas separadas.

4. **Hito 4 - Árbol y IP de Grupo**:
   - **Archivo**: `Milestone4.m`
   - **Descripción**: Calcula el índice de productividad de cada investigador y determina el **IP** del grupo. Genera un **árbol de máximo coste** para representar las relaciones más fuertes dentro de los grupos. Los árboles se guardan en un archivo `.mat`.
   - **Datos generados**: `hito4_arboles.mat`, contiene los árboles generados para cada grupo de investigación.

5. **Hito 5 - Estructura del Grupo**:
   - **Archivo**: `Milestone5.m`
   - **Descripción**: Genera un árbol jerárquico con el IP en la raíz y representa gráficamente la estructura del grupo de investigación.

### Pasos para la Ejecución:

1. **Clona este repositorio**:
   ```bash
   git clone https://github.com/tuusuario/proyecto-investigacion.git
   ```
2. **Carga los archivos de datos** en MATLAB y asegúrate de tener todos los archivos necesarios en la carpeta `Data/`.
3. **Ejecuta los archivos correspondientes**:
   - `Milestone1.m` para generar el grafo inicial.
   - `Milestone2.m` para identificar los grupos de investigación.
   - `Milestone3.m` para visualizar los grupos identificados.
   - `Milestone4.m` para determinar el IP y generar el árbol de colaboración.
   - `Milestone5.m` para visualizar la estructura jerárquica de los grupos.

---

## 📊 Visualización de Resultados

Cada hito genera gráficos en MATLAB que permiten analizar las colaboraciones y la estructura de los grupos de investigación:

- **Grafo de colaboración** (Hito 1).
- **Visualización de los grupos** (Hito 3).
- **Árbol jerárquico de colaboración** con el IP como raíz (Hito 5).

