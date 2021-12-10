<h1>PostgreSQL</h1>

<h3>Oswaldo Rodríguez González</h3>

<h1>Tabla de Contenido</h1>

- [1. Configurar Postgres](#1-configurar-postgres)
  - [Qué aprenderás sobre PostgreSQL](#qué-aprenderás-sobre-postgresql)
  - [¿Qué es Postgresql?](#qué-es-postgresql)
  - [Instalación y configuración de la Base de Datos](#instalación-y-configuración-de-la-base-de-datos)
  - [Interacción con Postgres desde la Consola](#interacción-con-postgres-desde-la-consola)
  - [PgAdmin: Interacción con Postgres desde la Interfaz Gráfica](#pgadmin-interacción-con-postgres-desde-la-interfaz-gráfica)
  - [Archivos de Configuración](#archivos-de-configuración)
  - [Comandos más utilizados en PostgreSQL](#comandos-más-utilizados-en-postgresql)
  - [Presentación del Proyecto](#presentación-del-proyecto)
  - [Tipos de datos](#tipos-de-datos)
  - [Diseñando nuestra base de datos: estructura de las tablas](#diseñando-nuestra-base-de-datos-estructura-de-las-tablas)
  - [Jerarquía de Bases de Datos](#jerarquía-de-bases-de-datos)
- [2. Gestión de la información en bases de datos](#2-gestión-de-la-información-en-bases-de-datos)
  - [Creación de Tablas](#creación-de-tablas)
  - [Particiones](#particiones)
  - [Creación de Roles](#creación-de-roles)
  - [Llaves foráneas](#llaves-foráneas)
  - [Inserción y consulta de datos](#inserción-y-consulta-de-datos)
  - [Inserción masiva de datos](#inserción-masiva-de-datos)
- [3. Generar consultas avanzadas](#3-generar-consultas-avanzadas)
  - [Cruzar tablas: SQL JOIN](#cruzar-tablas-sql-join)
  - [Funciones Especiales Principales](#funciones-especiales-principales)
  - [Funciones Especiales Avanzadas](#funciones-especiales-avanzadas)
  - [Vistas](#vistas)
  - [PL/SQL](#plsql)
  - [Triggers](#triggers)
- [4. Integrar bases de datos con servicios externos](#4-integrar-bases-de-datos-con-servicios-externos)
  - [Simulando una conexión a Bases de Datos remotas](#simulando-una-conexión-a-bases-de-datos-remotas)
  - [Transacciones](#transacciones)
  - [Otras Extensiones para Postgres](#otras-extensiones-para-postgres)
- [5. Implementar mejores prácticas](#5-implementar-mejores-prácticas)
  - [Backups y Restauración](#backups-y-restauración)
  - [Mantenimiento](#mantenimiento)
  - [Introducción a Réplicas](#introducción-a-réplicas)
  - [Implementación de Réplicas en Postgres](#implementación-de-réplicas-en-postgres)
  - [Otras buenas prácticas](#otras-buenas-prácticas)
  - [Cierre del curso](#cierre-del-curso)

# 1. Configurar Postgres

## ¿Qué es Postgresql?

PostgreSQL cumple ACID

>  A atomicidad
> C consistencia
> I (isolation) aislamiento
> D durabilidad

- Tipos de Datos
- Integridad de Datos
- Concurrencia. Rendimiento
- Fiabilidad, recuperación ante desastres
- Seguridad
- Extensibilidad
- Internacionalización, Búsqueda de texto.

> 1- El motor de bases datos (RDBMS) es quién estructura toda la información de la base de dato. 
>
> 2- El servidor es una computadora dónde se instala el motor de base de dato. 
>
> 3- La bases es la información ordenada, relacionada y estructurada a la cual accedemos con SQL

• **A**: Atomicity – Atomicidad -> Separar las funciones desarrolladas en la BD como pequeñas tareas y ejecutarlas como un todo. Si alguna tarea falla se hace un rollback(Se deshacen los cambios)
• **C**: Consistency – Consistencia -> Todo lo que se desarrolló en base al objeto relacional. Los datos tienen congruencia
• **I**: Isolation – Aislamiento -> Varias tareas ejecutándose al mismo tiempo dentro de la BD
• **D**: Durability – Durabilidad -> Puedes tener seguridad que la información no se perderá por un fallo catastrófico. PostgreSQL guarda la información en una Bitácora

[![img](https://www.google.com/s2/favicons?domain=//static.platzi.com/media/favicons/platzi_favicon.png)Qué es el teorema CAP y cómo elegir la base de datos para tu proyecto](https://platzi.com/blog/que-es-el-teorema-cap-y-como-elegir-la-base-de-datos-para-tu-proyecto)

[![img](https://www.google.com/s2/favicons?domain=https://www.postgresql.org//favicon.ico)PostgreSQL: The world's most advanced open source database](https://www.postgresql.org/)

## Instalación y configuración de la Base de Datos

Vamos a instalar PostgreSQL en nuestra computadora. A continuación veremos el paso a paso y algunos consejos útiles para instalar y configurar correctamente PostgreSQL en nuestro equipo. En éste caso, usaremos Windows, pero los pasos son bastante similares entre los diferentes sistemas operativos.

Primer paso: ir a https://www.postgresql.org/.

Actualmente, la página web oficial de postgres luce así:

![1.png](https://static.platzi.com/media/user_upload/1-82324fcc-cd15-407b-ac6c-ddc47d8a243a.jpg)

Ten en cuenta que puedes ver esta página en diferentes idiomas, depende de la configuración predeterminada de idioma de tu navegador.

Hacer clic en el botón ‘Download’ (Descarga) que se encuentra en la parte inferior derecha. Veremos lo siguiente:

![2.png](https://static.platzi.com/media/user_upload/2-b1e35963-ed85-4e61-9c0e-9a43eaac00b6.jpg)

Veremos lo siguiente:
Seleccionamos la opción que corresponda con tu sistema operativo, para éste caso hacemos clic en “Windows”:

Veremos en la parte inferior:

![3.png](https://static.platzi.com/media/user_upload/3-a99ee1d6-6468-465e-96fa-4f72a2308289.jpg)

Haz clic en el enlace “Download the installer”. Esto nos va a llevar a la Web de Enterprise DB o EDB. EDB es una empresa que ofrece servicios sobre el motor de base de datos PostgreSQL y ofrece un instalador para Postgres de manera gratuita.

![4.png](https://static.platzi.com/media/user_upload/4-ca32d0f5-6047-4f85-bd8a-72bd28642684.jpg)

Es altamente recomendable seleccionar la penúltima o antepenúltima versión. Si bien la última versión estable está disponible, en éste caso la 12.0, no es recomendable instalarla en nuestro equipo, ya que al momento de instalarla o usar un servicio en la Nube para Postgres, lo más seguro es que no esté disponible y sólo esté hasta la versión 11.5, que no es la última versión. Esto porque todos los proveedores de Infraestructura no disponen de la versión de Postgres más actual siempre (tardan un poco en apropiar los nuevos lanzamientos).

Si tienes un equipo con Linux, la instalación la puedes hacer directamente desde los repositorios de Linux, EDB ya no ofrece soporte para instaladores en Linux debido a que se ha vuelto innecesario, el repositorio de Linux con PostgreSQL ofrece una manera mucho más sencilla y estándar para instalar PostgreSQL en linux.

Segundo paso: descargamos la versión “Windows x86-64” (porque nuestro sistema operativo es de 64 bits). En caso de que tu equipo sea de 32 bits debes seleccionar la opción “Windows x86-32”.

Vamos a descargar la versión 11.5. Hacemos clic en Download y guardamos el archivo que tendrá un nombre similar a:
“postgresql-11.5-2-windows-x64.exe”

Ahora vamos a la carpeta donde descargamos el archivo .exe, debe ser de aproximadamente 190 MB, lo ejecutamos.

Veremos lo siguiente:

![5.png](https://static.platzi.com/media/user_upload/5-600d1a76-de39-4796-b7bd-00fd0fa4d3a3.jpg)

Hacemos clic en siguiente. Si deseas cambiar la carpeta de destino, ahora es el momento:

![6.png](https://static.platzi.com/media/user_upload/6-c3545ad4-a4c4-47a1-8272-bfa8468d054e.jpg)

Seleccionamos los servicios que queremos instalar. En este caso dejamos seleccionados todos menos “Stack Builder”, pues ofrece la instalación de servicios adicionales que no necesitamos hasta ahora. Luego hacemos clic en siguiente:

![7.png](https://static.platzi.com/media/user_upload/7-5687b5e0-d34e-49bc-9163-8e58ff2162e3.jpg)

Ahora indicamos la carpeta donde iran guardados los datos de la base de datos, es diferente a la ruta de instalación del Motor de PostgreSQL, pero normalmente será una carpeta de nuestra carpeta de instalación. Puedes cambiar la ruta si quieres tener los datos en otra carpeta. Hacemos clic en siguiente.

![8.png](https://static.platzi.com/media/user_upload/8-f634519b-aea8-43a3-84de-0a23e95cc8e3.jpg)

Ingresamos la contraseña del usuario administrador. De manera predeterminada, Postgres crea un usuario super administrador llamado `postgres` que tiene todos los permisos y acceso a toda la base de datos, tanto para consultarla como para modificarla. En éste paso indicamos la clave de ese usuario super administrador.

Debes ingresar una clave muy segura y guardarla porque la vas a necesitar después. Luego hacemos clic en siguiente.

![9.png](https://static.platzi.com/media/user_upload/9-11aa6e1a-572b-4f1c-a037-ca83472b7fe1.jpg)

Ahora si queremos cambiar el puerto por donde el servicio de Postgresql estará escuchando peticiones, podemos hacerlo en la siguiente pantalla, si queremos dejar el predeterminado simplemente hacemos clic en siguiente.

![10.png](https://static.platzi.com/media/user_upload/10-a2b1eceb-7c3c-43c6-887d-2d3e9e5c66da.jpg)

La configuración regional puede ser la predeterminada, no es necesario cambiarla, incluso si vamos a usarla en español, ya que las tildes y las eñes estarán soportadas si dejas la configuración regional predeterminada. Es útil cambiarla cuando quieras dejar de soportar otras funciones de idiomas y lenguajes diferentes a uno específico. Luego hacemos clic en siguiente:

![11.png](https://static.platzi.com/media/user_upload/11-eee9d065-17f4-4c83-978a-712f27cbbe81.jpg)

En pantalla aparecerá el resumen de lo que se va a instalar:

![12.png](https://static.platzi.com/media/user_upload/12-0d51a90f-495e-455d-9fc3-075ef91ba19a.jpg)

Al hacer clic en siguiente se muestra una pantalla que indica que PostgreSQL está listo para instalar, al hacer clic de nuevo en siguiente iniciará la instalación, espera un par de minutos hasta que la aplicación termine.

Una vez terminada la instalación, aparecerá en pantalla un mensaje mostrando que PostgreSQL ha sido instalado correctamente.

![13.png](https://static.platzi.com/media/user_upload/13-98b744e3-de8a-4cf4-975c-6df50ca8b109.jpg)

Podemos cerrar ésta pantalla y proceder a comprobar que todo quedó instalado correctamente.

Vamos a buscar el programa PgAdmin, el cual usaremos como editor favorito para ejecutar en él todas las operaciones sobre nuestra base de datos.

También vamos a buscar la consola… Tanto la consola como PgAdmin son útiles para gestionar nuestra base de datos, una nos permite ingresar comando por comandos y la otra nos ofrece una interfaz visual fácil de entender para realizar todas las operaciones.

En el menú de Windows (o donde aparecen instalados todos los programas) buscamos “PgAdmin…”

![14.png](https://static.platzi.com/media/user_upload/14-f1f1223a-7735-400a-9a94-be4031dbef74.jpg)

Ahora buscamos “SQL Shell…”

![15.png](https://static.platzi.com/media/user_upload/15-faad2c1d-8252-4af6-9f41-465a3952fcc8.jpg)

Efectivamente, ahora aparecen las herramientas que vamos a utilizar en éste curso.
Ahora vamos a crear una base de datos de prueba usando la consola y comprobaremos si existe usando PgAdmin, la crearemos para validar que la conexión con el servicio de base de datos interno funciona correctamente.

Para ello abrimos la consola, buscamos SQL Shell y lo ejecutamos. Veremos algo así:

![16.png](https://static.platzi.com/media/user_upload/16-2b8a8090-9e18-4e4d-a9a2-c41732bae301.jpg)

Lo que vemos en pantalla es la consola esperando que ingresemos cada parámetro para la conexión.

Primero está el nombre del parámetro. En éste caso es “Server” seguido de unos corchetes que contienen el valor predeterminado. Si presionamos “Enter” sin digitar nada la consola asumirá que te refieres al valor predeterminado, si en éste caso presionamos “Enter” el valor asumido será “Localhost”. Localhost se refiere a nuestra propia máquina, si instalaste la base de datos en el mismo pc que estás usando para la consola, el valor correcto es Localhost o 127.0.0.1 (representan lo mismo).

Podemos dejar todos los valores predeterminados (presionando “Enter”) hasta que la consola pregunte por la clave del usuario maestro:

![17.png](https://static.platzi.com/media/user_upload/17-f0b53470-a533-4c2b-b5b3-501fc68e93f6.jpg)

Debemos ingresar la clave que usamos cuando estábamos instalando Postgres, de lo contrario no podremos acceder. Presionamos Enter y veremos a continuación una pantalla que nos indica que estamos logueados en la base de datos y estamos listos para hacer modificaciones.

De manera predeterminada, la base de datos instalada es Postgres, la cual no debemos tocar, ya que ejecuta funciones propias del motor. Es usada por el Motor de PostgreSQL para interactuar con todas las bases de datos que vayamos a crear en el futuro.

La siguiente imagen indica que estamos conectados a la base de datos Postgres. Vamos a crear una base de datos nueva y luego saltar el cursor a ésta base de datos recién creada.

![18.png](https://static.platzi.com/media/user_upload/18-ac8f31b5-f307-4e43-b935-cb8b97b8b7c5.jpg)

Para ello escribimos el comando “CREATE DATABASE transporte_publico;” y presionamos “Enter”. Veremos:

![19.png](https://static.platzi.com/media/user_upload/19-267d7da8-f68e-45ea-9fab-150aa62fefc5.jpg)

El mensaje “CREATE DATABASE” justo después de la línea que acabamos de escribir indica que la base de datos fue creada correctamente.

Para saltar a la base de datos recién creada ejecutamos el comando “\c transporte_publico”, el cursor mostrará lo siguiente:

![20.png](https://static.platzi.com/media/user_upload/20-f904c2a7-3eff-4ac9-8801-a75a9a5bb9fb.jpg)

Ahora vamos a validar desde PgAdmin que la base de datos fué creada correctamente. Abrimos PgAdmin y nos encontramos con una lista de items a la izquierda, lo que significa que de manera predeterminada PgAdmin ha creado un acceso a nuestra base de datos local, el cual llamó “PostgreSQL 11”:

![21.png](https://static.platzi.com/media/user_upload/21-028b8530-63f5-4bc4-b1d6-0bdac6885cfe.jpg)

Al hacer hacer doble clic sobre éste elemento (“PostgreSQL 11”) nos pedirá ingresar la clave que hemos determinado para el super usuario postgres, al igual que la consola, hasta no ingresarla correctamente no nos podremos conectar:

![22.png](https://static.platzi.com/media/user_upload/22-0e0171ab-3ae9-4798-9188-7b14181cb83b.jpg)

Ingresamos la clave. Te recomiendo seleccionar la opción “Save Password” o “Guardar Contraseña”. Si la máquina sobre la que estás trabajando es de confianza, que seas sólo tú o tu equipo quien tenga acceso a ella, de lo contrario, no guardes la contraseña para mantenerla segura.
Veremos la lista de bases de datos disponibles, la predeterminada “postgres” y la que acabamos de crear usando la consola, lo que comprueba que la base de datos y la consola funcionan correctamente.

![23.png](https://static.platzi.com/media/user_upload/23-ff23bf88-a5f8-4449-8d89-78492b9cb834.jpg)

Ahora procedemos a eliminar la base de datos recién creada para comprobar que PgAdmin está correctamente configurada y si pueda realizar cambios sobre la base de datos.

Para ello hacemos clic derecho sobre el elemento “transporte_publico” y seleccionamos la opción “Delete/Drop”. Al mensaje de confirmar hacemos clic en OK.

Con ello, si el elemento “transporte_publico” desaparece del menú de la izquierda comprobamos que PgAdmin funcionan correctamente.

[Github Gist](https://gist.github.com/superjojo140/2a0221d517f356965371b3969f37b29f)

## Interacción con Postgres desde la Consola

1. ENTRAR A LA CONSOLA DE POSTGRES
   **`psql -U postgres -W`**
2. VER LOS COMANDOS \ DE POSTGRES
   **`\?`**
3. LISTAR TODAS LAS BASES DE DATOS
   **`\l`**
4. VER LAS TABLAS DE UNA BASE DE DATOS
   **`\dt`**
5. CAMBIAR A OTRA BD
   **`\c nombre_BD`**
6. DESCRIBIR UNA TABLA
   **`\d nombre_tabla`**
7. VER TODOS LOS COMANDOS SQL
   **`\h`**
8. VER COMO SE EJECTUA UN COMANDO SQL
   **`\h nombre_de_la_funcion`**
9. CANCELAR TODO LO QUE HAY EN PANTALLA
   **`Ctrl + C`**
10. VER LA VERSION DE POSTGRES INSTALADA, IMPORTANTE PONER EL ';'
    **`SELECT version();`**
11. VOLVER A EJECUTAR LA FUNCION REALIADA ANTERIORMENTE
    **`\g`**
12. INICIALIZAR EL CONTADOR DE TIEMPO PARA QUE LA CONSOLA TE DIGA EN CADA EJECUCION ¿CUANTO DEMORO EN EJECUTAR ESA FUNCION?
    **`\timing`**
13. LIMPIAR PANTALLA DE LA CONSOLA PSQL
    **`Ctrl + L`**

Iniciar postgresql en terminal

```sh
sudo -u postgres psql
```



[PostgreSQL, Instalación en Linux (Ubuntu y distros similares)](https://www.youtube.com/watch?v=40uGNsi7ysc)



## PgAdmin: Interacción con Postgres desde la Interfaz Gráfica

## Archivos de Configuración

## Comandos más utilizados en PostgreSQL

## Presentación del Proyecto

## Tipos de datos

## Diseñando nuestra base de datos: estructura de las tablas

## Jerarquía de Bases de Datos

# 2. Gestión de la información en bases de datos

## Creación de Tablas

## Particiones

## Creación de Roles

## Llaves foráneas

## Inserción y consulta de datos

## Inserción masiva de datos

# 3. Generar consultas avanzadas

## Cruzar tablas: SQL JOIN

## Funciones Especiales Principales

## Funciones Especiales Avanzadas

## Vistas

## PL/SQL

## Triggers

# 4. Integrar bases de datos con servicios externos

## Simulando una conexión a Bases de Datos remotas

## Transacciones

## Otras Extensiones para Postgres

# 5. Implementar mejores prácticas

## Backups y Restauración

## Mantenimiento

## Introducción a Réplicas

## Implementación de Réplicas en Postgres

## Otras buenas prácticas

## Cierre del curso