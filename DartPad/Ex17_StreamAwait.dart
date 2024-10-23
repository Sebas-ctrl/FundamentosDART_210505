void main() {
  // La función emitNumbers() sirve para retornar un Stream.
  // Se utiliza el método listen() para escuchar los valores emitidos por el Stream.
  // Cada vez que el Stream emite un nuevo valor, se ejecuta el callback que imprime el valor en la consola.

  emitNumber().listen((int value) {
    // Imprime el valor emitido por el Stream..
    print('Stream value: $value');
  });
}

Stream<int> emitNumber() async* {
  // La función emitNumbers() retorna un Stream de enteros.
  // La palabra async sirve para crear una función asíncrona

  // Se define una lista de valores que se emitirán en el Stream.
  final valuesToEmit = [1, 2, 3, 4, 5];

  // Se utiliza un bucle for que itera sobre cada valor de la lista valuesToEmit.
  for (int i in valuesToEmit) {

    await Future.delayed(const Duration(seconds: 1));
    // Retrasa un segundo para simular la espera de una solicitud

    yield i;
    // yield emite el valor actual del contador al Stream.
  }
}
