##APACHE TOMCAT

Vinculación con eclipse

1. Abrir eclipse, ir a **Window** (arriba de todo) y selección **preferencias**
2. Click en **server**
3. En las opciones desplegadas seleccionar **Apache Tomcat**
4. Click en **add**, elegir la versión de apache instalada y dar siguiente
5. Ingresar la ubicación de la carpeta donde está instalado el Apache Tomcat y hacer click en finalizar

##AGREGAR UN .JAR AL PROYECTO

1. Click derecho en el proyecto y seleccionar **propiedades**
2. Click en **Java Build Path** y seleccionar libraries (arriba)
3. Click en  **Add external JARs**, elegir el .jar y seleccionar ok

##JDK – JAVA DEVELOMENT KIT

*Que hacer luego de instalarlo (uno de los métodos)*

1. Ir a: inicio > panel de control > sistema y seguridad > sistema
2. Seleccionar configuración avanzada del sistema y en la ventana que aparece hacer click en variables de entorno
3. Hacer doble click en la variable llamada **Path**
4. En el campo **Valor de la variable** agregar un ; y seguido la ubicación de la carpeta bin que está dentro de java\jdk[version] (Ej: ;C:\Program Files\Java\jdk1.8.0_60\bin) y por último aceptar

##CONECTAR DB A ECLIPSE

*Importar DB en el phpmyadmin*
*Una vez en eclipse seguir los siguientes pasos:*

1. Ir de **Window > show view**
2. Si no muestra la opcion Data Source Explorer seleccionar **other>Data Management > Data Source Explorer** y darle ok
3. Ir a la pestaña **Data Source Explorer** (abajo de todo) y dar click derecho en **Database Conections** y seleccionar new
4. Seleccionar mysql y en la ventana siguiente hacer esto:
  + Donde dice **database** poner el nombre de nuestra db 
  + Donde dice **URL** reemplazar el final donde dice database por nuestra db 
  + Donde dice **Drivers** hacer click en el boton    new driver definition
  + En la pestaña **Name/Type** seleccionar el de version 5.1
  + En la pestaña **Jar List** hacer click en el driver q aparece y despues en edit JAR / zip y buscar el driver de sql en la   carpeta del repo que descargo la app de git
5. Aceptar todo
6. click derecho en la db y conectar
