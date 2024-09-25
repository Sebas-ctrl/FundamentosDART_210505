void main() {
  // Clase con parámetros posicionales
  final Hero thor = Hero('Thor', 'Trueno');
  
  // Clase con parámetros no posicionales, los puedo mandar en desorden
  final Team avengers = Team(type: 'Héroes', name: 'Avengers');
  final Team thanos = Team(name: 'Thanos');
  
  print(thor.toString());
  print(thor.name);
  print(thor.power);
  print("---------------------------------------------");
  print(avengers);
  print(avengers.name);
  print(avengers.type);
  print("---------------------------------------------");
  print(thanos);
  print(thanos.name);
  print(thanos.type);
}

class Hero {
  String name;
  String power;
  
  /*Hero(this.name, 
    required this.power);*/
  Hero(String pName, String pPower) 
    : name = pName,
      power = pPower;
      
  @override
  String toString() {
    return '$name - $power';
  }
}

class Team {
  String name;
  String type;
  
  Team({required this.name, this.type = "No definido"});
}