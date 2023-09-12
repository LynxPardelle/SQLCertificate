# Sentencias del sublenguaje TCL

Presentaremos en formato .sql, el script de la implementación de dichas sentencias.

# Consigna

 Elige dos tablas de las presentadas en tu proyecto. Realizarás una serie de modificaciones en los registros, controladas por transacciones.

# Formato

- El archivo a presentar debe tener como nombre “TCL+Apellido”
- Será, como siempre, un archivo del tipo .sql.

# Aspectos a incluir

- En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. Si no tiene registros la tabla, reemplaza eliminación por inserción.
- Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.
- Si eliminas registros importantes, deja comentadas las sentencias para re-insertarlos.
- En la segunda tabla, inserta ocho nuevos registros iniciando también una transacción.
- Agrega un savepoint a posteriori de la inserción del registro #4 y otro savepoint a posteriori del registro #8
- Agrega en una línea comentada la sentencia de eliminación del savepoint de los primeros 4 registros insertados.

