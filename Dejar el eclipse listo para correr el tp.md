1	APACHE TOMCAT

Vinculación con eclipse

1º) Abrir eclipse, ir a Windows (arriba de todo) y selección preferencias
2º) Click en server
3º) En las opciones desplegadas seleccionar Apache Tomcat
4º) Click en add, elegir la versión de apache instalada y dar siguiente
5º) Ingresar la ubicación de la carpeta donde está instalado el Apache Tomcat y hacer click en finalizar

2	AGREGAR UN .JAR AL PROYECTO

1º) Click derecho en el proyecto y seleccionar propiedades
2º) Click en Java Build Path y seleccionar libraries (arriba)
3º) Click en  Add external JARs, elegir el .jar y seleccionar ok

3	JDK – JAVA DEVELOMENT KIT

Que hacer luego de instalarlo (uno de los métodos)

1º) Ir a: inicio > panel de control > sistema y seguridad > sistema
2º) Seleccionar configuración avanzada del sistema y en la ventana que aparece hacer click en variables de entorno
3º) Hacer doble click en la variable llamada Path, agregar un ; y seguido la ubicación de la carpeta bin que está dentro de java\jdk[versión] (Ej: ;C:\Program Files\Java\jdk1.8.0_60\bin) y por último aceptar

4 CONECTAR DB A ECLIPSE

-Importar DB en el phpmyadmin
-Una vez en eclipse seguir los siguientes pasos:

1º) Ir de Window > show view
2º) Si no muestra la opcion Data Source Explorer seleccionar other>Data Management > Data Source Explorer y dalr ok
3º) Ir a la pestaña Data Source Explorer (abajo de todo) y dar click derecho en Database Conections y seleccionar new
4º) Seleccionar mysql y en la ventana siguiente hacer esto:
  1-Donde dice database poner el nombre de nuestra db
  2-Donde dice URL reemplazar el final donde dice database por nuestra db
  3-Donde dice Drivers haver click en el boton new driver definition
  4-En la pestaña Name/Type seleccionar el de version 5.1
  5-En la pestaña Jar List hacer click en el driver q aparece y despues en edit JAR / zip y buscar el driver de mongo en la carpeta del repo que descargo la app de git
  6- Aceptar todo
5º) click derecho en la db y conectar
