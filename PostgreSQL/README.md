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



## Docker-compose ingresar a nuestra base de datos Postgresql

ingresar al bash de docker-compose

```sh
docker-compose exec postgres bash
```

Ingresar a postgresql

```sh
psql -h localhost -d my_postgres -U victor
```

[PostgreSQL, Instalación en Linux (Ubuntu y distros similares)](https://www.youtube.com/watch?v=40uGNsi7ysc)



## PgAdmin: Interacción con Postgres desde la Interfaz Gráfica

> Postgres es el mejor motor de base de datos.

> La interfaz de PgAdmin nos permite ver de manera grafica muchísima información referente a nuestras bases de datos, acá veremos un breve resumen de las diferentes opciones que nos ofrece.

> En Servers, si le damos clic derecho, podemos crear nuestra propia consulta de base de datos al servidor, pero con opciones nuevas propias de la interfaz grafica como definir un color de resaltado con el cual identificar nuestra consulta, y darle un nombre a nuestra conexión para identificarla. Ademas podemos al igual que con el Shell definir todas las opciones de conexión como el host, puerto, nombre de usuario, password, etc.

> La conexión en PgAdmin nos permite verla de manera grafica en forma de árbol donde tenemos en el primer nivel; las bases de datos, los usuarios que se pueden conectar a las mismas y los Tablespaces que son espacios físicos donde guardar nuestros datos.

> En la base de datos tenemos ademas un segundo nivel donde podemos ver todas las opciones que tiene nuestra base de datos y que en el shell tendríamos que visualizar y acceder a través de comandos:

> • Casts: Que es para hacer traducción de tipos de datos explicito.
> • Catalogs: Para catalogar la información, como una especie de subdirectorio de tablas.
> • Event Triggers: En un apartado donde podremos ejecutar funciones en base a acciones que pasan en la base de datos.
> • Extension: Nos servirá para instalar módulos desarrollados por terceros para nuestra base de datos.
> • Foreign Data Wrappers: Es acceso a base de datos remoto.
> • Languages: Hace referencia a los lenguajes de programación que puedes usar dentro de la base de datos.
> • Schemas: Nos permite ver la información propia de las tablas de nuestra base de datos.

> Ademas PgAdmin nos permite ver en tiempo real informacion de lo que sucede con nuestra base de datos, al hacer clic en “Databases” nos mostrara en el panel a la derecha una ventana con distintas pestañas:

> • Dashboard: Nos muestra las conexiones simultaneas, las transacciones, lo que esta escribiendo, lo que esta leyendo, lo que esta borrando. En la parte inferior en “server activity” podemos ver las funciones que se estan ejecutando para la base de datos que estamos visualizando.
> • Properties: Nos muestra las propiedades de nuestra DB, como los tipos de datos, el dueño de la base de datos.
> • Statistics: Nos mostrara datos estadísticos de nuestra DB.
> • Dependencies: Nos enseña las dependencias que tenga nuestra base de datos.

> Igualmente podemos ejecutar consultas SQL en PgAdmin, posicionandonos en la base de datos donde queremos realizarlas y seleccionando en la opción del menú superior Tools, Query Tool.

[How to Install pgAdmin 4 on Ubuntu 20.04 | 18.04](https://computingforgeeks.com/how-to-install-pgadmin-4-on-ubuntu/)

[![img](https://www.google.com/s2/favicons?domain=https://www.pgadmin.org//static/img/favicon.ico)pgAdmin - PostgreSQL Tools](https://www.pgadmin.org/)

## Archivos de Configuración

Archivos de configuración.

A través de la sentencia

```sql
show config_file;
```

 se nos muestra donde están los archivos de configuración. En mi caso la ruta es:

```sh
Library/PostgreSQL/12/data/postgresql.conf
```

Algo a tener en cuenta es que en la ruta por default de instalación no se puede acceder debido a falta de permisos. Para ingresar basta con un:

```sh
sudo cd /Library/PostgreSQL/12/data/
```

**Postgresql.conf**: Configuración general de postgres, múltiples opciones referentes a direcciones de conexión de entrada, memoria, cantidad de hilos de pocesamiento, replica, etc.

**pg_hba.conf**: Muestra los roles así como los tipos de acceso a la base de datos.

**pg_ident.conf**: Permite realizar el mapeo de usuarios. Permite definir roles a usuarios del sistema operativo donde se ejecuta postgres.

___

Archivos Configuracion
`- postgresql.conf`
`- pg_hba.conf`
`- pg_ident.conf`

Muestra la ruta de nuestros archivos de configuracion
**`SHOW config_file;`**

`- postgresql.conf:` Configuración general de postgres, múltiples opciones referentes a direcciones de conexión de entrada, memoria, cantidad de hilos de pocesamiento, replica, etc.

`- pg_hba.conf:` Muestra los roles así como los tipos de acceso a la base de datos.

`- pg_ident.conf:` Permite realizar el mapeo de usuarios. Permite definir roles a usuarios del sistema operativo donde se ejecuta postgres.

```sql
# Query Editor | button
# find de file's
SHOW config_file;
```

[![img](https://www.google.com/s2/favicons?domain=//static.platzi.com/media/favicons/platzi_favicon.png)Domina la Administración de Usuarios y Permisos en Servidores Linux](https://platzi.com/blog/administracion-usuarios-servidores-linux/)

## Comandos más utilizados en PostgreSQL

**La Consola**

La consola en PostgreSQL es una herramienta muy potente para crear, administrar y depurar nuestra base de datos. podemos acceder a ella después de instalar PostgreSQL y haber seleccionado la opción de instalar la consola junto a la base de datos.

PostgreSQL está más estrechamente acoplado al entorno UNIX que algunos otros sistemas de bases de datos, utiliza las cuentas de usuario nativas para determinar quién se conecta a ella (de forma predeterminada). El programa que se ejecuta en la consola y que permite ejecutar consultas y comandos se llama psql, psql es la terminal interactiva para trabajar con PostgreSQL, es la interfaz de línea de comando o consola principal, así como PgAdmin es la interfaz gráfica de usuario principal de PostgreSQL.

Después de emitir un comando PostgreSQL, recibirás comentarios del servidor indicándote el resultado de un comando o mostrándote los resultados de una solicitud de información. Por ejemplo, si deseas saber qué versión de PostgreSQL estás usando actualmente, puedes hacer lo siguiente:

![1.png](https://static.platzi.com/media/user_upload/1-3db23704-3297-40cf-b3fc-27ec761a2579.jpg)

***Comandos de ayuda\***

En consola los dos principales comandos con los que podemos revisar el todos los comandos y consultas son:

- **`\?`** Con el cual podemos ver la lista de todos los comandos disponibles en consola, comandos que empiezan con backslash ( \ )

![2.png](https://static.platzi.com/media/user_upload/2-f3fd936e-bdb2-4583-afce-1899ca222a77.jpg)

- **`\h`** Con este comando veremos la información de todas las consultas SQL disponibles en consola. Sirve también para buscar ayuda sobre una consulta específica, para buscar información sobre una consulta específica basta con escribir **`\h`** seguido del inicio de la consulta de la que se requiera ayuda, así: **`\h ALTER`**

De esta forma podemos ver toda la ayuda con respecto a la consulta ***ALTER\***

![3.png](https://static.platzi.com/media/user_upload/3-ee850ea6-271e-4826-9d8f-aa054dddc3fc.jpg)

***Comandos de navegación y consulta de información\***

- **`\c`** Saltar entre bases de datos
- **`\l`** Listar base de datos disponibles
- **`\dt`** Listar las tablas de la base de datos
- **`\d <nombre_tabla>`** Describir una tabla
- **`\dn`** Listar los esquemas de la base de datos actual
- **`\df`** Listar las funciones disponibles de la base de datos actual
- **`\dv`** Listar las vistas de la base de datos actual
- **`\du`** Listar los usuarios y sus roles de la base de datos actual

***Comandos de inspección y ejecución\***

- **`\g`** Volver a ejecutar el comando ejecutando justo antes
- **`\s`** Ver el historial de comandos ejecutados
- **`\s <nombre_archivo>`** Si se quiere guardar la lista de comandos ejecutados en un archivo de texto plano
- **`\i <nombre_archivo>`** Ejecutar los comandos desde un archivo
- **`\e`** Permite abrir un editor de texto plano, escribir comandos y ejecutar en lote. **\e** abre el editor de texto, escribir allí todos los comandos, luego guardar los cambios y cerrar, al cerrar se ejecutarán todos los comandos guardados.
- **`\ef`** Equivalente al comando anterior pero permite editar también funciones en PostgreSQL

***Comandos para debug y optimización\***

- **`\timing`** Activar / Desactivar el contador de tiempo por consulta

***Comandos para cerrar la consola\***

- **`\q`** Cerrar la consola

***Ejecutando consultas en la base de datos usando la consola\***

De manera predeterminada PostgreSQL no crea bases de datos para usar, debemos crear nuestra base de datos para empezar a trabajar, verás que existe ya una base de datos llamada ***postgres\*** pero no debe ser usada ya que hace parte del CORE de PostgreSQL y sirve para gestionar las demás bases de datos.

Para crear una base de datos debes ejecutar la consulta de creación de base de datos, es importante entender que existe una costumbre no oficial al momento de escribir consultas; consiste en poner en mayúsculas todas las palabras propias del lenguaje SQL cómo ***CREATE, SELECT, ALTE\***, etc y el resto de palabras como los nombres de las tablas, columnas, nombres de usuarios, etc en minúscula. No está claro el porqué de esta especie de “estándar” al escribir consultas SQL pero todo apunta a que en el momento que SQL nace, no existían editores de consultas que resaltaran las palabras propias del lenguaje para diferenciar fácilmente de las palabras que no son parte del lenguaje, por eso el uso de mayúsculas y minúsculas.

Las palabras reservadas de consultas SQL usualmente se escriben en mayúscula, ésto para distinguir entre nombres de objetos y lenguaje SQL propio, no es obligatorio, pero podría serte útil en la creación de Scripts SQL largos.

Vamos ahora por un ligero ejemplo desde la creación de una base de datos, la creación de una tabla, la inserción, borrado, consulta y alteración de datos de la tabla.

Primero crea la base de datos, “**CREATE DATABASE transporte**;” sería el primer paso.

![4.png](https://static.platzi.com/media/user_upload/4-669e8520-bb3d-47f5-9002-a3f5fcaf9191.jpg)

Ahora saltar de la base de datos ***postgres\*** que ha sido seleccionada de manera predeterminada a la base de datos transporte recién creada utilizando el comando **`\c transporte`**.

![5.png](https://static.platzi.com/media/user_upload/5-7d6dd8c4-a03b-48b7-b077-4cb589f55ee2.jpg)

Ahora vamos a crear la tabla tren, el SQL correspondiente sería:

```
CREATE TABLE tren ( id serial NOT NULL, modelo character varying, capacidad integer, CONSTRAINT tren_pkey PRIMARY KEY (id) );
```

La columna id será un número autoincremental (cada vez que se inserta un registro se aumenta en uno), modelo se refiere a una referencia al tren, capacidad sería la cantidad de pasajeros que puede transportar y al final agregamos la llave primaria que será id.

![6.png](https://static.platzi.com/media/user_upload/6-444c767c-7f5b-4410-ac3a-df6c23d4552a.jpg)

Ahora que la tabla ha sido creada, podemos ver su definición utilizando el comando **`\d tren`**

![7.png](https://static.platzi.com/media/user_upload/7-93ef9744-1514-4d83-bf0b-b13462b639ca.jpg)

PostgreSQL ha creado el campo id automáticamente cómo integer con una asociación predeterminada a una secuencia llamada ‘tren_id_seq’. De manera que cada vez que se inserte un valor, id tomará el siguiente valor de la secuencia, vamos a ver la definición de la secuencia. Para ello, **`\d tren_id_seq`** es suficiente:

![8.png](https://static.platzi.com/media/user_upload/8-6f223092-0ee7-49db-8979-b251f1d5f56a.jpg)

Vemos que la secuencia inicia en uno, así que nuestra primera inserción de datos dejará a la columna id con valor uno.

**`INSERT INTO tren( modelo, capacidad ) VALUES (‘Volvo 1’, 100);`**

![9.png](https://static.platzi.com/media/user_upload/9-86a5c14f-d2ef-45eb-b835-abbb32f0d34b.jpg)

Consultamos ahora los datos en la tabla:

**`SELECT \* FROM tren;`**

![10.png](https://static.platzi.com/media/user_upload/10-2c25adb4-615f-4691-973f-c0a231c33d60.jpg)

Vamos a modificar el valor, establecer el tren con id uno que sea modelo Honda 0726. Para ello ejecutamos la consulta tipo **`UPDATE tren SET modelo = 'Honda 0726' Where id = 1;`**

![11.png](https://static.platzi.com/media/user_upload/11-b1d3b646-6ca6-4ae0-9005-ed002c21ef32.jpg)

Verificamos la modificación **`SELECT \* FROM tren;`**

![12.png](https://static.platzi.com/media/user_upload/12-370abb43-290b-43bd-a1c2-609c42b85767.jpg)

Ahora borramos la fila: **`DELETE FROM tren WHERE id = 1;`**

![13.png](https://static.platzi.com/media/user_upload/13-4224641d-e97f-4e01-8784-19b2a9d39386.jpg)

Verificamos el borrado **`SELECT \* FROM tren;`**

![14.png](https://static.platzi.com/media/user_upload/14-9a75b2b9-587b-476a-88b1-15c6164104c8.jpg)

El borrado ha funcionado tenemos 0 rows, es decir, no hay filas. Ahora activemos la herramienta que nos permite medir el tiempo que tarda una consulta **`\timing`**

![15.png](https://static.platzi.com/media/user_upload/15-ccffbd2f-fd1a-4fa2-ae31-43313bc5a82b.jpg)

Probemos cómo funciona al medición realizando la encriptación de un texto cualquiera usando el algoritmo md5:

![16.png](https://static.platzi.com/media/user_upload/16-0699feec-184c-4aa3-8b9a-2a03e1326238.jpg)

La consulta tardó 10.011 milisegundos

![Captura de Pantalla 2021-01-14 a la(s) 22.46.34.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202021-01-14%20a%20la%28s%29%2022.46.34-cb8e2c20-3649-4a6e-8ad5-3fb42a33424f.jpg)

## Presentación del Proyecto

Aquí el modelo entidad-relación para solucionar el reto.

![img](https://i.ibb.co/hg45VxP/Soluci-n-reto1.jpg)

> Puedes echarle un vistazo a **sqlalchemy** si usas `python`, también hay una librería llamada **pymongo** para Mongo. En lo personal, he usado lo que mencionas para dos cosas:
>
> 1. Crear tablas desde un framework con ayuda del ORM, por ejemplo, Django.
> 2. Hacer conexiones para utilizar los datos que están dentro de ellas y generar pues alguna relación matemática o algo así.

**Proyecto: Sistema de transporte por Tren**

**Instancias**:

- Pasajero
- Trayecto
- Estación
- Tren
- Viaje

**Agrego un esquema de las instancias y algunos atributos posibles para utilizar en este proyecto.**

![DER_Sistema_trenes_Postgres1.png](https://static.platzi.com/media/user_upload/DER_Sistema_trenes_Postgres1-10093577-91c0-4841-af56-cfe4fc5b340f.jpg)

> El pasajero podría modelarse como:
>
> **pasajero**(numero de tarjeta de acceso, estacion de entrada, hora de entrada)

## Tipos de datos

Tipos de datos

Principales:
Numéricos(Numeros enteros, Numeros Decimales, Seriales)
Monetarios(cantidad de moneda)
Texto(almacenar cadenas y texto, existen tres VARCHAR, CHAR, TEXT)
Binario(1 Y 0)
Fecha/Hora(Para almacenar Fechas y/o Horas, DATE TYPE, TIME TYPE, TIMESTAMP, INTERVAL)
Boolean(Verdadero o Falso)
Especiales propios de postgres
Geométricos: Permiten calcular distancias y áreas usando dos valores X y Y.
Direcciones de Red: Cálculos de máscara de red
Texto tipo bit: Cálculos en otros sistemas, ejm(hexadecimal, binario)
XML, JSON: Postgres no permite guardar en estos formatos
Arreglos: Vectores y Matrices

Principales:

- Numéricos
- Monetarios
- texto
- Binarios
- Fecha / Hora
- Boolean

Especiales:

- Geométricos
- Dirección de Red
- Texto tipo bit
- XML, JSON
- Arreglos

[![img](https://www.google.com/s2/favicons?domain=https://todopostgresql.com/wp-content/uploads/2019/04/cropped-logo_tp_512-32x32.png)PostgreSQL data types, tipos de datos más utilizados - TodoPostgreSQL](https://todopostgresql.com/postgresql-data-types-los-tipos-de-datos-mas-utilizados/)

[![img](https://www.google.com/s2/favicons?domain=https://www.postgresql.org/docs/11/datatype.html/favicon.ico)PostgreSQL: Documentation: 11: Chapter 8. Data Types](https://www.postgresql.org/docs/11/datatype.html)

## Diseñando nuestra base de datos: estructura de las tablas

Nombre de las Tablas en Plural:

Estaciones
Trenes
Usuarios

Etc Etc

![Captura de pantalla 2020-05-25 a la(s) 04.26.56.png](https://static.platzi.com/media/user_upload/Captura%20de%20pantalla%202020-05-25%20a%20la%28s%29%2004.26.56-df5bf572-df44-4bbe-8b36-f0feaf7781e7.jpg)

![Captura.PNG](https://static.platzi.com/media/user_upload/Captura-37dabc12-1db1-4362-9c90-c9e4c65125c0.jpg)

![DISENO_PROYECTO.png](https://static.platzi.com/media/user_upload/DISENO_PROYECTO-18866a37-5be7-476c-b379-ec1289eb8241.jpg)

## Jerarquía de Bases de Datos

Toda jerarquía de base de datos se basa en los siguientes elementos:

- **Servidor de base de datos:** Computador que tiene un motor de base de datos instalado y en ejecución.
- **Motor de base de datos:** Software que provee un conjunto de servicios encargados de administrar una base de datos.
- **Base de datos:** Grupo de datos que pertenecen a un mismo contexto.
- **Esquemas de base de datos en PostgreSQL:** Grupo de objetos de base de datos que guarda relación entre sí (tablas, funciones, relaciones, secuencias).
- **Tablas de base de datos:** Estructura que organiza los datos en filas y columnas formando una matriz.

**PostgreSQL es un motor de base de datos.**

La estructura de la base de datos diseñada para el reto corresponde a los siguientes
elementos:

![1.png](https://static.platzi.com/media/user_upload/1-9a247404-0b98-43d3-bc7e-649e66cad472.jpg)

La base de datos se llama transporte, usaremos su esquema predeterminado public.

El esquema public contiene las siguientes tablas:

- Estación
- Pasajero
- Tren

Y las tablas de relaciones entre cada uno de los elementos anteriores son:

- Trayecto
- Viaje

El esquema relacional entre las tablas corresponde al siguiente diagrama:

![2.png](https://static.platzi.com/media/user_upload/2-3d80d1c7-2ea2-475c-b625-c11c5b76b9aa.jpg)

***Estación\***
Contiene la información de las estaciones de nuestro sistema, incluye datos de nombre con tipo de dato texto y dirección con tipo de dato texto, junto con un número de identificación único por estación.

***Tren\***
Almacena la información de los trenes de nuestro sistema, cada tren tiene un modelo con tipo de dato texto y una capacidad con tipo de dato numérico que representa la cantidad de personas que puede llevar ese tren, también tiene un ID único por tren.

***Trayecto\***
Relaciona los trenes con las estaciones, simula ser las rutas que cada uno de los trenes pueden desarrollar entre las estaciones

***Pasajero\***
Es la tabla que contiene la información de las personas que viajan en nuestro sistema de transporte masivo, sus columnas son nombre tipo de dato texto con el nombre completo de la persona, direccion_residencia con tipo de dato texto que indica dónde vive la persona, fecha_nacimiento tipo de dato texto y un ID único tipo de dato numérico para identificar a cada persona.

***Viaje\***
Relaciona Trayecto con Pasajero ilustrando la dinámica entre los viajes que realizan las personas, los cuales parten de una estación y se hacen usando un tren.

# 2. Gestión de la información en bases de datos

## Creación de Tablas

![1.PNG](https://static.platzi.com/media/user_upload/1-ed1127e6-920f-4ed0-8e31-92476c9cb42d.jpg)

```sql
-- Si la base de datos existe la elimina
DROP DATABASE IF EXISTS transporte;
-- Creamos la base de datos
CREATE DATABASE transporte
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

-- Nos movemos a la base de datos creada
\c transporte

-- Tabla pasajero
CREATE TABLE public.pasajero(
    id serial,
    nombre character varying(100),
    direccion_residencia character varying,
    fecha_nacimiento date,
    CONSTRAINT pasajero_pkey PRIMARY KEY (id)
) WITH ( OIDS = FALSE );
AlTER TABLE public.pasajero OWNER to postgres;

-- Insertar un pasajero
INSERT INTO public.pasajero(nombre, direccion_residencia, fecha_nacimiento)
VALUES('Primer Pasajero', 'Direccion X', '1996-04-24');

-- Para ver la fecha actual
SELECT current_date;

--Tabla estacion
CREATE TABLE public.estacion(
    id serial,
    nombre character varying(50),
    direccion character varying(50),
    CONSTRAINT estacion_pkey PRIMARY KEY (id)
) WITH ( OIDS = FALSE );
ALTER TABLE public.estacion OWNER to postgres;

-- Tabla tren
CREATE TABLE public.tren (
    id serial,
    modelo character varying(50),
    capacidad integer,
    CONSTRAINT tren_pkey PRIMARY KEY (id)
) WITH ( OIDS = FALSE );
ALTER TABLE public.tren OWNER to postgres;

-- Tabla trayecto
CREATE TABLE public.trayecto (
	id serial,
	nombre charactervarying(50),
	id_estacion integer,
	id_tren integer,
	CONSTRAINT trayecto_pkey PRIMARY KEY (id)
) WITH ( OIDS = FALSE );
ALTER TABLE public.trayecto OWNERto postgres;

-- Tabla viaje
CREATE TABLE public.viaje (
    id serial,
    id_pasajero integer,
    id_trayecto integer,
    inicio timestamp without time zone,
    fin timestamp without time zone,
    CONSTRAINT viaje_pkey PRIMARY KEY (id)
) WITH ( OIDS = FALSE );
ALTER TABLE public.viaje OWNER to postgres;
```

## Particiones

![Captura2.PNG](https://static.platzi.com/media/user_upload/Captura2-28c2695b-6973-429f-a41e-8998a49ebd2e.jpg)

**Particion de tablas**

```sql
Particiones
- Separacion fisica de datos
- Estructura logica

-- Tabla bitacora_viaje
CREATE TABLE public.bitacora_viaje(
    id serial,
    id_viaje integer,
    fecha date
) PARTITION BY RANGE (fecha) WITH (OIDS = FALSE);
ALTER TABLE public.bitacora_viaje OWNER to postgres;

-- Vamos a crear la particion
CREATE TABLE bitacora_viaje201001 PARTITION OF public.bitacora_viaje
FOR VALUES FROM ('2010-01-01') TO  ('2020-04-24');

-- Insertamos un dato --> ERROR antes de crear la particions
INSERT INTO public.bitacora_viaje(id_viaje, fecha)
VALUES(1, '2010-01-01');

-- Mostramos los valores de la tabla bitacora_viaje
SELECT * FROM bitacora_viaje;

-- eliminamos la tabla bitacora_viaje y se eliminara la particion igualmente
DROP TABLE bitacora_viaje;
```

**Crear tabla particionada**

```sql
# Insertar 
INSERT INTO public.bitacora_viaje(
	id_viaje, fecha)
	VALUES (1, '2010-01-10');

# Consultar Tabla
SELECT * FROM bitacora_viaje;

# Crear Tabla Particionada
CREATE TABLE bitacora_viaje201001 PARTITION OF bitacora_viaje
FOR VALUES FROM ('2010-01-01') To ('2010-12-31');
```

## Creación de Roles

ROLES

Que puede hacer un ROLE

- Crear y Eliminar
- Asignar atributos
- Agrupar con otros roles
- Roles predeterminados

```sql
-- Ver las funciones del comando CREATE ROLE (help)
\h CREATE ROLE;

-- Creamos un ROLE (consultas -> lectura, insertar, actualizar)
CREATE ROLE usuario_consulta;

-- Mostrar todos los usuarios junto a sus atributos
\dg

-- Agregamos atributos al usuario o role
ALTER ROLE  usuario_consulta WITH LOGIN;
ALTER ROLE  usuario_consulta WITH SUPERUSER;
ALTER ROLE  usuario_consulta WITH PASSWORD'1234';

-- Elimanos el usuario o role
DROP ROLE usuario_consulta;

-- La mejor forma de crear un usuario o role por pgadmin
CREATE ROLE usuario_consulta WITH
  LOGIN
  NOSUPERUSER
  NOCREATEDB
  NOCREATEROLE
  INHERIT
  NOREPLICATION
  CONNECTION LIMIT -1
  PASSWORD'1234';

--Para obtorgar privilegios a nuestro usuario_consulta
GRANT INSERT, SELECT, UPDATE ON TABLE public.estacion TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.pasajero TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.trayecto TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.tren TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.viaje TO usuario_consulta;
```

>  Usuarios Linux, a nosotros no nos sale la opcion de configurar el inicio de psql con el usuario todo eso se tiene que hacer a través de este comando.
>
> ```sh
> psql -h <host> -d <base de datos> -U <usuario> -p <port>
> ```

## Llaves foráneas

Hay que tener bastante cuidado con el borrado y la actualizacion en cascada, esto podria generar cuellos de botella en el rendimento del aplicativo cuando se modifica la llave y borrar informacion puede ser una opcion devastadora para la integridad de la informacion.

```sql
ALTER TABLE public.trayecto
    ADD FOREIGN KEY (id_estacion)
    REFERENCES public.estacion (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;
ALTER TABLE public.trayecto
    ADD FOREIGN KEY (id_tren)
    REFERENCES public.tren (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;
```

LLaves Foranes

- Consistencia
  Estructura
- Tabla origen
- Tabla destino
- Acciones

```sql
-- Agregamos llave foranea de id_estacion a la tabla trayecto
ALTER TABLE public.trayecto
    ADD CONSTRAINT trayecto_estacion_fkey FOREIGN KEY (id_estacion)
    REFERENCES public.estacion (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

-- Agregamos llave foranea de id_tren a la tabla trayecto
ALTER TABLE public.trayecto
    ADD CONSTRAINT trayecto_tren_fkey FOREIGN KEY (id_tren)
    REFERENCES public.tren (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

-- Agregamos llave foranea de id_trayecto a la tabla viaje
ALTER TABLE public.viaje
    ADD CONSTRAINT viaje_trayecto_fkey FOREIGN KEY (id_trayecto)
    REFERENCES public.trayecto (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

-- Agregamos llave foranea de id_pasajero a la tabla viaje
ALTER TABLE public.viaje
    ADD CONSTRAINT viaje_pasajero_fkey FOREIGN KEY (id_pasajero)
    REFERENCES public.pasajero (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

-- Para borrar una llave foranea por si tienes algun error
ALTER TABLE public.viaje DROP CONSTRAINT viaje_trayecto_fkey;
```

En la pestania Action le tenemos que decir que hacer a la base de datos entre la tabla origen y la tabla destino cuando ocurra un cambio:

- `NO ACTION:` No hacer nada
- `RESTRICT:` Decirle a Postgres que no podemos permitir que la tabla cambie algo.
- `CASCADE:` Si cambio la tabla de origen, la tabla destino tambien cambia.
- `SET NULL` quiere decir que nuestra columna en esa fila va a dejar de tener por ejemplo el ID que tenia asociado un 77 y va a convertirse en NULL. Esto por que la tabla destino recibe un cambio y le decimos aPostgres que lo ponga en nulo.
- `SET DEFAULT`: Si hay un cambio en la tabla origen nuestra tabla destino ponga un valor predeterminado. En un ejemplo un id podra quedar NULL.

## Inserción y consulta de datos

```sql
--/////////////////
--16.Inserción y consulta de datos
--////////////////



SELECT * FROM public.estacion;--si data
SELECT * FROM public.pasajero;--reto
SELECT * FROM public.trayecto;--si data
SELECT * FROM public.tren;--si data
SELECT * FROM public.viaje;--reto




--insert "estacion"
INSERT INTO public.estacion (nombre,direccion)
VALUES 
    ('Estación Centro','St 1# 12'),
    ('Estación Norte','St 100# 112')
;

--insert "tren"
INSERT INTO public.tren (capacidad,modelo)
VALUES 
    (100,'Modelo 1'),
    (100,'Modelo 2')
;

--insert "trayecto"
INSERT INTO public.trayecto (tren,estacion,nombre)
VALUES
    (1,1,'Ruta 1');
    (2,2,'Ruta 2');
;

-- RETO
INSERT INTO public.pasajero (nombre,fecha_nacimiento,direccion_residencia)
VALUES
    ('José Ordoñez','1987-1-3','St 100# 12'),
    ('Ángel Quintero','1987-1-12','St 101# 12'),
    ('Rafel Castillo','1977-1-12','St 102# 12'),
;
INSERT INTO public.viaje (id_pasajero,id_trayecto,inicio,fin)
 VALUES
    (1,1,'2019-01-02','2019-01-02'),
    (2,1,'2019-01-03','2019-01-03'),
    (2,2,'2019-01-04','2019-01-04'),
    (3,2,'2019-01-04','2019-01-04')

;
-- Delete sin limit
DELETE FROM public.estacion WHERE estacion.id  =4;
--delete limit
DELETE FROM public.estacion WHERE estacion.id IN
     (
		SELECT id FROM public.estacion 
	  		WHERE estacion.id IN(3,4)
			ORDER BY  estacion.id  
		 	LIMIT 2
	 )
;

-- update sin limit
UPDATE public.estacion
SET id=4, nombre='Estación SUR-OESTE', direccion='St 4# 1'
WHERE estacion.id = 4;

-- update utilizando limit
UPDATE public.estacion
	SET 
		id=4, 
		nombre='Estación SUR-OESTE', 
		direccion='St 4# 1'
	WHERE id IN (
		SELECT estacion.id FROM public.estacion
			WHERE estacion.id in(4)
			ORDER BY estacion.id
			LIMIT 1
	)
;
```

Añadir algo el delete con limit es algo que vi en el curso de mysql sql y es buena práctica limitar la operación por si algo sale mal, pero en el caso de postgres me parece que es algo contra producente ya que para hacerlo con limit hay que hacerlo a través de una subquery.

## Inserción masiva de datos

No conocía Mockaroo, mis días de estar pensando qué datos insertar para poder ir probando y practicando se han acabado.

Quisiera mencionarles, que en la página también se puede insertar código SQL, tocando el botón “Fx” al final del campo. Por ejemplo, en el campo del id de tren, toqué “Fx” y puse lo siguiente:

```sql
code("(SELECT id FROM tren ORDER BY RANDOM() LIMIT 1)")
```

Este query lo que hace es buscar un id aleatorio de la tabla tren.

Finalmente, una de las líneas que me generó la página es la siguiente:

```sql
insert into trayecto (nombre, trenid, estacionid) values ('Court', (SELECT id FROM tren ORDER BY RANDOM() LIMIT 1), (SELECT id FROM estacion ORDER BY RANDOM() LIMIT 1));
```



[![img](https://www.google.com/s2/favicons?domain=https://mockaroo.com/assets/favicon-8d320ac46812befcc8e0c5388550bd14d2105f78bb354728e63dd50d9e345ede.png)Mockaroo - Random Data Generator and API Mocking Tool | JSON / CSV / SQL / Excel](https://mockaroo.com/)

# 3. Generar consultas avanzadas

## Cruzar tablas: SQL JOIN

**Tipos de Join**

![img](https://ingenieriadesoftware.es/wp-content/uploads/2018/07/sqljoin.jpeg)

```sql
--------------------------RESUMEN----------------------------------------
/* Inner join: solo nos trae los datos que coinciden en ambas tablas. */
select * from route r
inner join train tr
on tr.train_id = r.train_id;

/* Este es un full outer join: trae todos los datos de ambas tablas. Coincidan o no. */
select * 
from route r
full outer join train tr
on tr.train_id = r.train_id;


/*Este full outer join ahora solo nos trae los datos que no coinciden de la tabla A 
 con la la tabla B, tambien nos trae los datos de la tabla B que no coiniden con la
 tabla A. (es como el opuesto del inner join, porque en lugar de traernos los que 
 coinciden en ambas tablas, nos trae solo los que no coinciden en ambas tablas.)*/
select * 
from route r
full outer join train tr
on tr.train_id = r.train_id
where r.train_id is null
or tr.train_id is null;


/* left join: nos trae todos los datos de la tabla A(izquierda) y solo los datos de la
 tabla B que coincidan en la tabla A. */
select * from route r
left join train tr
on tr.train_id = r.train_id;

/* left outer join: nos devuelve todos los datos de la tabla A que no coincide con la
tabla B. */
select * from route r
left join train tr
on tr.train_id = r.train_id
where tr.train_id is null;

/*right join: nos devuelve todos los datos de la tabla B, y solo los datos de la tabla
A que coincidan con la tabla B*/
select * from route r
right join train tr
on tr.train_id = r.train_id;

/* right outer join: nos trae todos los datos de la tabla B que no coinciden con
la tabla A*/

select * from route r
right join train tr
on tr.train_id = r.train_id
where r.train_id is null;

/*NOTA: Cuando usamos left join (Tabla A a la tabla B) estamos usando la tabla A, es
decir traemos todos los datos de la tabla A y solo los datos de la tabla B que coinciden
con la tabla A. si queremos usar un left outer join la llave primaria null que debemos
especificar es la de la tabla B.
WHERE b.pkey us null;
lo mismo pasa cuando usamos un right outer join
como usamos la tabla B y solo los que coinciden con la tabla A entonces la llave null
que usamos es de la tabla A.
WHERE a.pkey us null;								*/
```

[![img](https://www.google.com/s2/favicons?domain=http://www.postgresqltutorial.com/postgresql-joins/)PostgreSQL Joins](http://www.postgresqltutorial.com/postgresql-joins/)

[![img](https://www.google.com/s2/favicons?domain=https://static.platzi.com/media/favicons/platzi_favicon.png)http://www.postgresqltutorial.com/wp-content/uploads/2018/12/PostgreSQL-Joins.png](http://www.postgresqltutorial.com/wp-content/uploads/2018/12/PostgreSQL-Joins.png)

## Funciones Especiales Principales

La función RETURNING es fundamental en la creación y uso de Stored procedure transaccionales. Al momento de insertar información con id autoincremental, con RETURNING podemos obtener dicho valor e insertarlo o referenciarlo en otras tablas.

cuando haya un conflicto de id con el INSERT, podemos actualizar la tupla correspondiente con los nuevos valores usando la palabra EXCLUDED, de la siguiente manera:

```sql
INSERT INTO tren
VALUES(1, 'Modelo modificado', 1000)
ON CONFLICT(id) 
DO UPDATE SET modelo = EXCLUDED.modelo, capacidad = EXCLUDED.capacidad;
```

Porque el profesor escribió a mano los nuevos valores de actualización en el SET, y eso no tiene ningún sentido en el caso de que esta actualización de tuplas a partir del conflicto de id sea ya un proceso automatizado.

Funciones especiales

- ON CONFLICT DO
- RETURNING
- LIKE / ILIKE
- IS / IS NOT

```sql
-- Insercion de un dato que ya existe, no pasa nada
INSERT INTO public.estacion(id, nombre, direccion)
VALUES (1, 'Nombre', 'Dire')
ON CONFLICT DO NOTHING;

-- Insercion de un dato que ya existe, te cambia los campos de nombre y direccion
INSERT INTO public.estacion(id, nombre, direccion)
VALUES (1, 'Nombre', 'Dire')
ON CONFLICT (id) DO UPDATE SET nombre = 'Nombre', direccion = 'Dire';

-- Insertara una tupla y mostrara la tupla
INSERT INTO public.estacion(nombre, direccion)
VALUES ('RETU', 'RETDIRE')
RETURNING *;

-- %: Uno o cualquier valor
-- _: Un valor
SELECT nombre FROM public.pasajero
WHERE nombre LIKE 'o%';
-- buscamos sin importar mayusculas o minusculas
SELECT nombre FROM public.pasajero
WHERE nombre ILIKE 'o%';

-- si una estacion o tren tiene un valor nulo
SELECT * FROM public.tren
WHERE modelo IS NULL;
```

## Funciones Especiales Avanzadas

Funciones Especiales avanzadas en PosgreSQL
• COALES: compara dos valores y retorna el que es nulo
• NULLIF: Retorna null si son iguales
• GREATEST: Compara un arreglo y retorna el mayor
• LEAST: Compara un arreglo de valores y retorna el menor
• BLOQUES ANONIMOS: Ingresa condicionales dentro de una consulta de BD

```sql
SELECT id, nombre, fecha_nacimiento,
	CASE
	WHEN nombre ILIKE 'a%' THEN 'Comienza con A' 
	WHEN nombre ILIKE 'e%' THEN 'Comienza con E'
	WHEN nombre ILIKE 'i%' THEN 'Comienza con I'
	WHEN ( current_date - fecha_nacimiento) > 6570 Then 'Es mayor de 18 años'
	ELSE 'Su nombre no inicia con A, E o I y ademas es un niño'
	END
FROM pasajero ORDER BY fecha_nacimiento;
```

`Code sql`

```sql
SELECT * FROM pasajero WHERE id = 5;
UPDATE pasajero SET nombre = NULL WHERE id = 5
SELECT COALESCE(nombre, 'Nombre en Null') AS nombrenull , * FROM pasajero WHERE id = 5;
SELECT NULLIF(0,0);
SELECT NULLIF(0,1);
SELECT GREATEST(5,5,8,95,75,4225,8,6,9,212,6);
SELECT LEAST(5,5,8,95,75,4225,8,6,9,212,6);
-- Reto
SELECT COALESCE(nombre, 'Nombre en Null') AS nombrenull , *,
CASE WHEN fecha_nacimiento > '2015-01-01' THEN
'Niño' ELSE 'Mayor' END,
CASE WHEN nombre ILIKE 'D%' THEN
'Empieza con D' ELSE 'No empieza con D' END, 
Case WHEN extract(years from age(current_timestamp,fecha_nacimiento::timestamp)) >= 18 THEN
'Mayor de edad.' ELSE 'Menor de edad.' END
FROM pasajero;
```

## Vistas

Centraliza muchos esfuerzos en una sola función.

Vista volátil: Siempre que se haga la consulta en la vista, la BD hace la ejecución de la consulta en la BD, por lo que siempre se va a tener información reciente.

Vista materializada: Hace la consulta una sola vez, y la información queda almacenada en memoria, la siguiente vez que se consulte, trae el dato almacenado, eso es bueno y malo a la vez, bueno porque la velocidad con la que se entrega la información es rápida, malo porque la información no es actualizada. Es ideal utilizar este tipo de vista en procesos que utilice días anteriores, porque el día de ayer, ya pasó y no hay razón para actualizarlo.

Para crear una vista volátil en postgres, damos click derecho a views, create, view, le damos un nombre, y en la pestaña code escribimos o pegamos el código de la consulta que queremos guardar, la guardamos y para usar la vista usamos:

```sql
    SELECT * FROM <nombre_vista>; y listo.
```

Para crear una vista materializada, primero creamos la consulta, y definimos si los datos nos interesan o no, luego, vamos a la opción materialized views, click derecho, create, materialized view. Se abre la ventana, le damos un nombre, termina con _mview, y en la pestaña Definition escribimos la consulta que necesitamos guardar. Guardamos.
Al probarla en este momento nos lanza un error, ¿por qué? porque no tiene datos almacenados. Para almacenar datos usamos:

```sql
    REFRESH MATERIALIZED VIEW <nombre vista>;
```

Y ahora si podemos consultarla:

```sql
    SELECT * FROM <nombre_vista_mview>;
```

> Tipos de vistas:
> **- Vista Volátil:** Consulta con data actualizada
> **- Vista Materializada:** Consulta con data persistente

Vistas

- Vista Volatil
- Vista Materializada: persistente (Ayer)

```sql
-- Creamos la vista
CREATE OR REPLACE VIEW public.rango_view
AS
    SELECT *,
        CASE
        WHEN fecha_nacimiento > '2015-01-01' THEN
            'Mayor'
        ELSE
            'Menor'
        END AS tipo
    FROM pasajero ORDER BY tipo;
ALTER TABLE public.rango_view OWNER TO postgres;

-- mostramos la vista
SELECT * FROM public.rango_view;

-- Vistas Materializada, no se cambia a menos que queramos que se cambie
SELECT * FROM viaje WHERE inicio > '22:00:00';

CREATE MATERIALIZED VIEW public.despues_noche_mview
AS
    SELECT * FROM viaje WHERE inicio > '22:00:00';
WITH NO DATA;
ALTER TABLE public.despues_noche_mview OWNER TO postgres;

-- observamos la vista
SELECT * FROM despues_noche_mview;

-- Damos refresh
REFRESH MATERIALIZED VIEW despues_noche_mview;

-- Borramos una tupla de viaje cuando el id = 2, para observar que no se borro
DELETE FROM viaje WHERE id = 2;
```

## PL/SQL

Las funciones y los Stored procedure son un pilar dentro de las bases de datos con ayuda de los lenguajes procedurales como PLPGSQL y PL/SQL (En el caso de Oracle). Gran parte de la lógica de negocios puede ser abstraída directamente en la base de datos con ayuda de dicho lenguaje permitiendo liberar al backend de parte de este procesamiento.

![Captura4.PNG](https://static.platzi.com/media/user_upload/Captura4-96ab9d65-0f83-48c7-b035-b515011ac551.jpg)

- PL Procedural language, también conocido como procedimientos almacenados, estas nos ayuda a desarrollar código directamente en el motor de bases de datos.
- Estructura de un Pl es: Declaración + uso de variable+ código +fin + retorno de valores o no retorna valores.UN bloque de código se ejecuta con la palabra DO $$ BEGIN --insert código here END $$
- RAISE NOTICE ‘message’, esta sentencia es para enviar un mensaje en el log de postgres
- Retornar una tabla
  [Retornar una tabla](https://stackoverflow.com/questions/18084936/pl-pgsql-functions-how-to-return-a-normal-table-with-multiple-columns-using-an).

DO$$ -Declaración de un bloque de código SQL
Estructura

```sql
DO $BODY$ 
    BEGIN 
        --insert código here 
    END 
$BODY$
```

Ejemplo de declaración de bloques de código con plpgsql

```sql
DO $$ 
    DECLARE
        rec record;
        contador integer :=0;
    BEGIN 
        --recorre  tabla pasajero y lo guarda en la variable rec
        FOR rec IN SELECT * FROM pasajero LOOP 
            RAISE NOTICE 'id: %     ,Nombre: %      ',
                        rec.id,rec.nombre;
            contador := contador + 1;
        END LOOP;
        RAISE NOTICE 'cantidad de registros:    %', contador;
    END 
$$
```

CREATE FUNTION - Declaración de una función SQL

```sql
CREATE FUNCTION  consulta_usuarios() 
    RETURNS void
    LANGUAGE 'plpgsql';
AS $BODY$ 
    DECLARE
        rec record;
        contador integer :=0;
    BEGIN 
        --recorre  tabla pasajero y lo guarda en la variable rec
        FOR rec IN SELECT * FROM pasajero LOOP 
            RAISE NOTICE 'id: %     ,Nombre: %      ',
                        rec.id,rec.nombre;
            contador := contador + 1;
        END LOOP;
        RAISE NOTICE 'cantidad de registros:    %', contador;
    END 
$BODY$
```

OTRO Ejemplo:
Retornar una tabla con plpgsql ¡¡¡¡importante!!! es importante cual select uses para llamar la función. la función funciona de la siguiente manera en el parámetro sí se introduce NULL retorna toda la lista, si se introduce id retornará esa tupla

```sql
--FUNCION QUE RETORNA UNA TABLA
--Mostrar tabla con plpgsql
--https://stackoverflow.com/questions/18084936/pl-pgsql-functions-how-to-return-a-normal-table-with-multiple-columns-using-an
DROP FUNCTION consulta_t_pasajero(p_pasajero_id integer);

CREATE OR REPLACE FUNCTION consulta_t_pasajero(p_pasajero_id integer) 
RETURNS TABLE(id integer, nombre character varying, direccion_residencia character varying, fecha_nacimiento date) 
LANGUAGE plpgsql
AS $BODY$
    BEGIN
		IF p_pasajero_id IS NULL THEN 
		 RETURN QUERY 
			SELECT pasajero.id, pasajero.nombre, pasajero.direccion_residencia, pasajero.fecha_nacimiento
			FROM public.pasajero;
		END IF;
		RETURN QUERY 
			SELECT pasajero.id, pasajero.nombre, pasajero.direccion_residencia, pasajero.fecha_nacimiento
			FROM public.pasajero
			WHERE pasajero.id = p_pasajero_id;
    END;
$BODY$

--Retorno en forma de fila
SELECT consulta_t_pasajero(NULL); 
SELECT consulta_t_pasajero(50);
--Retorno en forma de tabla
SELECT * FROM consulta_t_pasajero(NULL);
SELECT * FROM consulta_t_pasajero(50);
```

[![img](https://www.google.com/s2/favicons?domain=https://www.postgresql.org/docs/9.2/plpgsql.html/favicon.ico)PostgreSQL: Documentation: 9.2: PL/pgSQL - SQL Procedural Language](https://www.postgresql.org/docs/9.2/plpgsql.html)

## Triggers

Para la creación de triggers se debe hacer los siguiente
Crear la función que activará el evento. Para ello se debe tomar los siguientes aspectos:

1. En la declaración de la función, en la sección del retorno se debe indicar que es tipo triggers es decir RETURNS TRIGGER.
   Luego indicar en que lenguaje está escrito es decir LANGUAE ‘plpgsql’
2. La función tipo triggers debe retornar los valores OLD acepta lo viejo o NEW acepta lo nuevo. Sí se retorna VOID en nuestra función de tipo triggers no aceptamos cambios es decir RETURN NEW;
3. Tanto NEW como OLD son un objeto de tipo record y contiene dentro de si el registro, es decir se puede acceder a los campos NEW.campo_nombre del registro

```sql
DROP FUNCTION IF EXISTS  count_on_insert_pasajero() CASCADE;

CREATE OR REPLACE FUNCTION count_on_insert_pasajero()
	RETURNS TRIGGER
	LANGUAGE 'plpgsql'
AS $BODY$
	DECLARE 
		contador integer:=0;
		rec record;
	BEGIN
		
		FOR rec IN SELECT * FROM pasajero LOOP 
			contador := contador + 1;
		END LOOP;
		RAISE NOTICE 'cantidad de registros:	%', contador;
		
		--insert record on conteo_pasajero
		INSERT INTO public.conteo_pasajero (total_pasajero,hora_conteo)
		VALUES (contador,now());
		
		RETURN NEW;
		
	END;	
$BODY$
```

Lo siguiente será crear la regla que estará a la escucha del evento para disparar el triggers, para ello se deberá tomar los siguientes aspectos.

1. CREATE TRIGGER name_trigger name_event ON name_table FOR EACH ROW EXECUTE PROCEDURE name_procedure;
2. En la primera sección cuando declaramos el trigger debemos indicar en que momento en que se debe disparar el trigger:
   CREATE TRIGGER name_trigger name_event ON name_table en el name_event allí puede ir alguno de estos tres parámetros para llamar la ejecución del trigger, estos son:

- BEFORE = antes,
- AFTER=luego,
- INSTEAD OF = hacer esto, en vez de lo que iba a hacer el motor de bases de datos.

1. FOR EACH ROW EXECUTE PROCEDURE name_procedure indica que es para registro o fila de nuestra tabla

```sql
-- CREACIÓN DE LA REGLA PARA EJECUTAR EL TRIGGER
CREATE TRIGGER trigger_on_insert_to_pasajero
AFTER INSERT ON pasajero 
FOR EACH ROW EXECUTE PROCEDURE count_on_insert_pasajero(); 
```

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

