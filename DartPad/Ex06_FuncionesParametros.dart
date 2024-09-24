void main() {
  // FUNCIONES
  // 1, Llamado de una función básica
  greetEveryone();

  // 2. Llamado de una función que retorna un valor
  // 2.1 Si no deseamos almacenar el valor, se invoca normalmente
  print("Hoy es el día número ${getDayNumber()}");
  // 2.2 Necesitamos almacenar el valor retornado para utilizar su valor en otras operaciones del programa
  final numeroDia = getDayNumber();
  print("En 3 días estaremos a ${(numeroDia + 3)}");
  
  // 3. Llamado de una función con parámetros
  print(greetSomeone("Sebastián Márquez"));
  // 3.1 ¿Y qué pasa si intentamos?
  print(greetSomeone(45));
  print(greetSomeone(-15));
  print(greetSomeone(3.1416));
  print(greetSomeone(true));
  
  // 3.2
  /*print(greetSomeoneTyped(45));
  print(greetSomeoneTyped(-15));
  print(greetSomeoneTyped(3.1416));
  print(greetSomeoneTyped(true));*/
  print(greetSomeoneTyped("Sebastián"));
  
  // 4. Llamado de funciones con varios parámetros posicionales
  // Para este caso los parámetros deber ser enviados en la posición exacta y según DART ambos por defecto son obligatorios
  print(greetSomeoneHourOfDay("Sebastián Márquez", 22));
  
  // ¿Qué pasa si sólo envío un sólo parámetro?
  /* 
  print(greetSomeoneHourOfDay(null, null));
  print(greetSomeoneHourOfDay("Sebastián"));
  print(greetSomeoneHourOfDay(10));
  */
  // Analizando la función determinamos que la hora del día puede ser nulo, y se puede definir con la hora actual del SO.
  print(greetSomeoneHourOfDay("Sebastián", null));
  print(greetSomeoneHourOfDay("Juan"));
  
  // 5. FUNCIONES LAMBDA, ANÓNIMAS, ARROW FUNCTIONS, FUNCIONES FLECHA
  /* Las funciones lambda, también conocidas como funciones anónimas o funciones flecha, se
   * ejecutan de manera simple y no frecuente en la ejecución de un programa o sistema, en 
   * DART estas funcionessólo pueden tener una sola instrucción para usar el operador => */
  var calculoTotalCarrito = (double productQuantity, double productPrice, double percentageDiscount) => (productQuantity * productPrice)*((100-percentageDiscount)/100);
  
  double cantidad = 3.180;
  double precio = 1725.10;
  double descuento = 8;
  
  print("""Costo del producto: $precio
  Cantidad solicitada: $cantidad
  Descuento definido: $descuento
  ---------------------------------------------------------------------------------------
  Costo total: ${calculoTotalCarrito(cantidad, precio, descuento)}""");
  
  // 6. Llamado de una función con parámetros nombrados
  print(infoCarListStatus(buyerName: "Gabriela"));
  
  // 6.1 LLamado de una función con los parámetros con desorden posicional
  print(infoCarListStatus(
    status: "En espara de pago", 
    amountCarList: 2416.20, 
    buyerName: "Alexia"
  ));
}

// 1. FUNCIONES SIN PARÁMETROS Y SIN RETORNO DE VALOR
greetEveryone() // <-- dynamic
{
  print("Hola a todas y todos desde DART");
}

// 2. FUNCIONES QUE RETORNAN VALORES
int getDayNumber() // <-- Retnorna un entero
{
  DateTime now = DateTime.now();
  return now.day;
}

// 3. FUNCIONES QUE REQUIEREN DE AL MENOS UN PARÁMETRO (SIN TIPIFICACIÓN)
String greetSomeone(personName) // <-- Retorna un String
{
  return "Hola, $personName";
}

// 3.1 FUNCIÓN QUE RECIBE PARÁMETROS TIPIFICADOS
String greetSomeoneTyped(String personName)
{
  return "Hola, $personName";
}

// 4. FUNCIONES QUE RECIBEN MÁS DE UN PARÁMETRO
// int? - El signo ? indica que puede ser nulo
// [] - Puede ser opcional
String greetSomeoneHourOfDay(String personName, [int? hourDay])
{
  String greeting;
  // El operador ??= significa que si es nulo lo inicialice como, en caso de que tenga valor ignora la instrucción
  hourDay ??= DateTime.now().hour;
  print("Hora: $hourDay");
  if(hourDay >= 0 && hourDay<12)
  {
    greeting = "Buenos días";
  }
  else if(hourDay >= 12 && hourDay < 18)
  {
    greeting = "Buenas tardes";
  }
  else
  {
    greeting = "Buenas noches";
  }
  
  return "$greeting, $personName";
}

// 6. FUNCIONES CON PARÁMETROS NOMBRADOS
String infoCarListStatus({required String buyerName, double amountCarList = 0.0, String status = "Selección de productos"})
{
  return "El carrito de compras de: $buyerName, tiene un total de: \$$amountCarList y actualmente está en estatus: $status";
}