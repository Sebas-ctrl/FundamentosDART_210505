void main() async {
  print('Inicio del programa');
  // Se realiza una impresión cuando se ejecuta el código...

  try {
    // El bloque try-catch sirve para controlar los posibles errores incluyendo los silenciosos

    /* 
    La palabra clave await hace que el programa se detenga hasta obtener el resultado y finalmente continuar.
    El resultado de la función asíncrona se almacena en value y luego se imprime.
    */
    final value = await httpGet('https://sebastian-marquez.com/cursos');

    // Si la llamada a la función httpGet fue exitosa, se debería imprimir a continuación el valor de value.
    print(value);
  } catch (err) {
    // De lo contrario, si se ocasiona un error, err como parámetro obtiene información del error.
    // A continuación se imprimirá lo siguiente.
    print('Tenemos un error: $err');
  }

  // Se imprime "Fin del programa" al final.
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  // Retrasa un segundo para simular la espera de una solicitud
  await Future.delayed(const Duration(seconds: 1));

  // Retorna un mensaje
  return "Llamado asincrono";
}