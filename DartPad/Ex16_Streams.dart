void main() {
  // La función emitNumbers() sirve para retornar un Stream.
  // Se utiliza el método listen() para escuchar los valores emitidos por el Stream.
  // Cada vez que el Stream emite un nuevo valor, se ejecuta el callback que imprime el valor en la consola.
  emitNumbers().listen( (value) {
    
    // Imprime el valor emitido por el Stream.
    print('Stream value: $value');
  });
} 

Stream<int> emitNumbers() {
  // La función emitNumbers() retorna un Stream de enteros.
  // Stream.periodic emite un nuevo valor periódicamente, en este caso, cada segundo.
  return Stream.periodic( const Duration(seconds: 1), (value) {
  
    // Se retorna el valor del contador que incrementa con cada llamada.
    return value;
  }).take(5);
  // Con take(5) se limita el número de llamadas y luego se cierra el programa...
}