void main() {
  // La declaracion de una list exta limitada por corchetes (brackets) y cada elemento de ser individual y puede repetirse.
  final numeros = [1, 2, 2, 2, 3, 4, 5, 6, 7, 7, 7, 7, 8, 8, 9, 10];

  print("Ejemplo de LIST: $numeros");
  print(
      "Confirmamos el tipo de dato para numeros que es: ${numeros.runtimeType}");
  print("Podemos acceder a cierta informacion de una lista tal como: ");
  print("EL tamaño: ${numeros.length}");
  print("""
  Para acceder a los elementos debemos especificar la posicion entre [] 
  El primer elemento en la primera posición es : ${numeros[0]}
  El elemento en la segunda posición es: ${numeros[1]}, siempre respetando la posición -1
  El último elemento de la lista sería: ${numeros[numeros.length - 1]}
  -------------------------------------------------------------------------
  De igual manera existen las siguientes alternativas
  Primer elemento: ${numeros.first}
  Último elemento: ${numeros.last}
  -------------------------------------------------------------------------
  También tendremos acceso a algunos método que permitan la transformación o filtrado del contenido
  Por ejemplo, usar reversed, para invertir el orden original: ${numeros.reversed}
  Es importante observar que la función reversed ha transformado la LIST original y la 
  retorna como un ITERABLE.
  """);
  
  // Iterables (Iterables)
  final numerosAlReves = numeros.reversed;
  print("Los iterables son estructuras de datos que DART y otros lenguajes para optimizar en términos de velocidad el acceso a los datos y propiedades");
  print("Ejemplo de un ITERABLE: $numerosAlReves");
  print("Confirmamos el tipo de datos para NUMEROSALREVES que es: ${numerosAlReves.runtimeType}");
  print("De igual manera podemos transformar una LISTA en ITERABLE y VICEVERSA");
  print("Convertimos el ITERABLE a LISTA usando .toList(): ${numerosAlReves.toList()} y verificamos su tipo de dato ${numerosAlReves.toList().runtimeType}");
  // Conjunto de datos (SET)
  // Un SET es una estructura de datos utilizada por DART, que simplifica los elementos eliminando los duplicados
  print("""Veamos que pasa con los conjuntos (SET)
  Convertimos el ITERABLE en un SET usando .toSet : ${numerosAlReves.toSet()}
  Podemos visualizar en el resultado que el SET ha eliminado los duplicados y ahora delimita los datos usando {}
  """);
  
  // De igual manera podemos realizar operaciones para el filtro de elementos usando .where()
  final numerosMayoresA5 = numeros.where((int num) {
    return num > 5;
  });
  
  
  print("""Hemos filtrado sobre la LIST sólo los elementos mayores a 5:
  Resultado de filtro: $numerosMayoresA5""");
  print("Elementos duplicados... ${numerosMayoresA5.toSet()}");
}