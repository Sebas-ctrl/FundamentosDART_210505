void main()
{
  //Declarando una variable generica para almacenar mi nombre
  var myName = "Sebas";
  String myLastName = "Márquez";
  final int myDNI = 210505;
  late final  int myAge;

  //Corregir mi nombre
  myName = "Sebastián";
  
  //myDNI=210555; Esto ocacionó un error por que la variable esta definida cómo final y no puede actualizar su valor
  print('Hola, $myName $myLastName, tu matricula es: $myDNI y tu edad aún no la conozco, por que no se cuando naciste.');

  //Interpolando el valor de las variables con meétodos de manipulación o transoformación
  print('\nHola, ${myName.toUpperCase()} ${myLastName.toUpperCase()}, tu matricula es: $myDNI y tu edad aún no la conozco, por que no se cuando naciste.');
}