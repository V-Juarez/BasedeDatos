![Operadores.jpg](https://static.platzi.com/media/user_upload/Operadores-e436b212-0a13-4f5e-83d5-e5becbc8b914.jpg)

## Actulizando varios documentos

Más operadores:

- `$set`: Permite agregar o modificar un atributo.
- `$rename`: Podemos renombrar un atributo sin necesidad de meterme con los valores.
- `$unset`: Eliminar algun atributo.



Modificadores del operador ***push\***

> **$each**
> Agrega múltiples valores al campo de la matriz.
> **$slice**
> Limita el número de elementos de la matriz. Requiere el uso del modificador $each.
> **$sort**
> Ordena los elementos de la matriz. Requiere el uso del modificador $each.
> **$position**
> Especifica la ubicación en la matriz en la que insertar los nuevos elementos. Requiere el uso del modificador $each. Sin el modificador $position, el $push agrega los elementos al final de la matriz

Mas sobre [**Array Update operators**](https://www.mongodb.com/docs/manual/reference/operator/update-array/)