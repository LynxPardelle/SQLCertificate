# Segunda entrega de tu Proyecto final
Deberás entregar los avances correspondiente a la segunda entrega de tu proyecto final, incluyendo lo presentado y ajustado en la primera entrega

# Se debe entregar
- Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen.
- Listado de Funciones que incluyan una descripción detallada, el objetivo para la cual fueron creadas y qué datos o tablas manipulan y/o son implementadas.
- Listado de Stored Procedures con una descripción detallada, qué objetivo o beneficio aportan al proyecto, y las tablas que lo componen y/o tablas con las que interactúa.
- Un archivo .sql que contenga:
  - Script de inserción de datos en las bases.
  - Si se insertan datos mediante rtación, agregar el paso a paso de éste en el DOC PDF más los archivos con el contenido a importar, en el formato que corresponda.
  - Script de creación de Vistas, Funciones, Stored Procedures y Triggers.

# Formato
Documento PDF con el nombre “Entrega2 + Apellido”.

# Sugerencias
Activar la posibilidad de realizar comentarios en el archivo que subis como Entrega. Debe incluir el contenido del documento PDF de la primera entrega parcial, además de lo requerido en esta segunda entrega.

# Correcciones

La documentacon explicando el objetivo de los objetos lo veo bien.

Un detalle. Tuve que cambiar de compu y perdi el schema. En el link entre esos archivos no estaria encontrando el script completo de la creacion. Si podrias pasarme asi vuelvo a cargarlo ,luego hago la insercion . y asi podria corregir los siguientes.

Schemas: <https://github.com/LynxPardelle/SQLCertificate/blob/main/ideaMontano.sql>

Inserts: <https://github.com/LynxPardelle/SQLCertificate/blob/main/ScriptInsMontano.sql>


La creacion e insercion lo pude hacer sin problemas.

Llegando a los triggers , por ejemplo, probando el de eliminacion me tira este error:

1415: Not allowed to return a result set from a trigger

Lo que veo extraño es que dentro de los triggers se encuentren llamado al SP donde dentro tiene vistas

El primer trigger funciona bien.

Deberiamos hacer lo siguiente. Habria que replantear los triggers teniendo en cuenta la consigna la cual pide. 4 triggers 2 a una tabla y otros 2 a otra tabla. Estos triggers deben impactar al realizar alguna accion tanto como insercion, modificacion o eliminacion de datos. LLevando la infommacion a las tablas de auditoria.

Si lo enfocamos de esta manera lo podemos volver a revisar

# Aclaraciones
Se crearon triggers nuevos que no usan stored procedures.