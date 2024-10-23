void main() async {
  // Se realiza una impresión al ejecutar el programa
  print('Inicio del programa');

  try {
    // El bloque try-catch sirve para controlar los posibles errores incluyendo los silenciosos

    /* 
    La palabra clave await hace que el programa se detenga hasta obtener el resultado y finalmente continuar.
    El resultado de la función asíncrona se almacena en value y luego se imprime.
    */
    final value = await httpGet('https://sebastian-marquez.com');
    
    // Si la llamada a la función httpGet fue exitosa, se debería imprimir a continuación el valor de value.
    print('éxito: $value' );

  } on Exception catch(err) {
    // De lo contrario, si se ocasiona una excepción de tipo Exception, 
    // err como parámetro obtiene información del error.
    // A continuación se imprimirá lo siguiente.
    print('Tenemos una Exception: $err');

  } catch (err) {
    // De lo contrario, si se ocasiona un error, err como parámetro obtiene información del error.
    // A continuación se imprimirá lo siguiente.
    print('OOP!! algo terrible pasó: $err');

  } finally {
    // El bloque finally se ejecuta siempre, independientemente de si se produjo un error
    print('Fin del try y catch');
  }
  
  // Se imprime el Fin del programa
  print('Fin del programa');
}


Future<String> httpGet( String url ) async {
  // async nos permite crear una función asíncrona.

  await Future.delayed( const Duration(seconds: 1));
  // Retrasa un segundo para simular la espera de una solicitud

  // Arroja una excepción de tipo Exception con el siguiente mensaje. Este error será capturado en 
  // el bloque on Exception
  throw Exception('No hay parámetros en el URL');
}