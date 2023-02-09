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



> Con los siguientes operadores podremos modificar los documentos que dentro contengan un array:
>
> - $push: Agrega un elemento en el array.
> - $pull: Remueve todos los elementos del array que hagan match con un query especifico.
> - $in: Hace match con algunos de los valores especificados en un arreglo.

Mas sobre [**Array Update operators**](https://www.mongodb.com/docs/manual/reference/operator/update-array/)

## update or insert

**upsert**: Esta condición permite agregar un elemento en un array dentro de un documento. Lo que lo hace especial es que si el documento no existe, este operador lo crea, y si ya existe, inserta los nuevo elementos del array sobre el documento existente.



# Query Operations

## Usando $eq y $ne

> $eq (equal)
> $ne (not equal)

## Usando $gt, $gte, $lt, $lte

> Operadores:
>
> - $gt (greater than - >)
> - $gte (greater than or equal - >=)
> - $lt (less than - <)
> - $lte (less than or equal - <=)

## Operadores para Arrays

> `$all` Matches arrays that contain all elements specified in the query.

> `$elemMatch` Select documents if element in the array field matches all the specified `$elemMatch` conditions.

> `$size` Selects documents if the array field is a specified size.

## Operadores logicos

Forma utilizando el $and implícito y $or explícito.

```db
db.routes.find({
    airplane: "E70",
    $or: [
        { dst_airport: "BOG" },
        { src_airport: "BOG" }
    ]
})
```

## Expresive operator

> `$expr` Allows use of aggregation expressions within the query language.


```mongo
use("sample_training")
db.trips.find({
    $and: [
        {$expr: {
            $eq: ["$start station id", "$end station id"]
        }},
        {tripduration: {
            $gte: 1200
        }}
    ]
}).count()
```
