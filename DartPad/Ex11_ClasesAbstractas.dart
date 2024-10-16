void main() {
  final windPlant = WindPlant(initialEnergy: 100);
  final nuclearPlant = NuclearPlant(energyLeft: 1000);
  print('wind: ${chargePhone(windPlant)}');
  print('nuclear: ${chargePhone(nuclearPlant)}');

  // Caso1: Nuevo miembro que se registra el día de hoy (datetime.now)
  final nuevoMiembro = MiembroNuevo(
    nivel: Nivel.Nuevo,
    antiguedad: "0 años",
    tipo: Tipo_Membresia.Individual,
    estatus_Membresia: true,
    estatus_Miembro: true,
    fecha_Registro: DateTime.now(),
  );
  nuevoMiembro.crearMiembro(nuevoMiembro);

  // Consultar todos los miembros
  nuevoMiembro.leerMiembros();

  // Caso2: Nuevo miembro,  que alguna vez fue trabajador del gimnasio
  final exTrabajadorMiembro = MiembroExTrabajador(
    nivel: Nivel.Oro,
    antiguedad: "5 años",
    tipo: Tipo_Membresia.Empresarial,
    estatus_Membresia: true,
    estatus_Miembro: true,
    fecha_Registro: DateTime(2018, 3, 10),
    fecha_Ultima_Visita: DateTime(2023, 5, 1),
  );
  exTrabajadorMiembro.crearMiembro(exTrabajadorMiembro);
  exTrabajadorMiembro.leerMiembros();

  // Caso3: Cancelar la membresia de un miembro.
  exTrabajadorMiembro.cancelarMembresia(exTrabajadorMiembro);
}

double chargePhone(EnergyPlant plant) {
  if (plant.energyLeft < 10) {
    throw Exception('Not enough energy');
  }

  return plant.energyLeft - 10;
}

enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {
  double energyLeft;
  final PlantType type;

  EnergyPlant({required this.energyLeft, required this.type});

  void consumeEnergy(double amount);
}

// extends o implements
class WindPlant extends EnergyPlant {
  WindPlant({required double initialEnergy})
      : super(energyLeft: initialEnergy, type: PlantType.wind);

  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}

class NuclearPlant implements EnergyPlant {
  @override
  double energyLeft;

  @override
  final PlantType type = PlantType.nuclear;

  NuclearPlant({required this.energyLeft});

  @override
  void consumeEnergy(double amount) {
    energyLeft -= (amount * 0.5);
  }
}

enum Nivel { Nuevo, Plata, Oro, Diamante }

enum Tipo_Membresia { Individual, Familiar, Empresarial }

abstract class Miembro {
  static final List<Miembro> miembros = [];
  final Nivel nivel;
  String antiguedad;
  final Tipo_Membresia tipo;
  bool estatus_Membresia;
  bool estatus_Miembro;
  DateTime fecha_Registro;
  DateTime? fecha_Ultima_Visita;

  Miembro(
      {required this.nivel,
      required this.antiguedad,
      required this.tipo,
      required this.estatus_Membresia,
      required this.estatus_Miembro,
      required this.fecha_Registro,
      this.fecha_Ultima_Visita});

  void cancelarMembresia(Miembro miembro) {}

  void crearMiembro(Miembro miembro) {
    miembros.add(miembro);
    print('Miembro creado correctamente');
  }

  void leerMiembros() {
    print('Lista de miembros:');
    for (var i = 0; i < miembros.length; i++) {
      var miembro = miembros[i];
      print("""
${i == 0 ? "------------------------------------" : ""}
${i + 1}:
  Nivel de membresía: ${miembro.nivel}. 
  Antigüedad: ${miembro.antiguedad}.
  Tipo de membresía: ${miembro.tipo}.
  Estatus de la membresía: ${miembro.estatus_Membresia}.
  Estatus del miembro: ${miembro.estatus_Miembro}.
  Fecha de registro: ${miembro.fecha_Registro}.
  Fecha de última visita: ${miembro.fecha_Ultima_Visita}.
------------------------------------
        """);
    }
  }

  void actualizarMiembro(Miembro miembroViejo, Miembro miembroNuevo) {
    final index = miembros.indexOf(miembroViejo);
    if (index != -1) {
      miembros[index] = miembroNuevo;
      print('Miembro actualizado: ${miembroNuevo.nivel}');
    }
  }

  void eliminarMiembro(Miembro miembro) {
    miembros.remove(miembro);
    print('Miembro eliminado');
  }
}

class MiembroNuevo extends Miembro {
  MiembroNuevo(
      {required Nivel nivel,
      required String antiguedad,
      required final Tipo_Membresia tipo,
      required bool estatus_Membresia,
      required bool estatus_Miembro,
      required DateTime fecha_Registro,
      DateTime? fecha_Ultima_Visita})
      : super(
            nivel: Nivel.Nuevo,
            antiguedad: antiguedad,
            tipo: tipo,
            estatus_Membresia: estatus_Membresia,
            estatus_Miembro: estatus_Miembro,
            fecha_Registro: fecha_Registro,
            fecha_Ultima_Visita: fecha_Ultima_Visita);
}

class MiembroExTrabajador extends Miembro {
  MiembroExTrabajador({
    required Nivel nivel,
    required String antiguedad,
    required Tipo_Membresia tipo,
    required bool estatus_Membresia,
    required bool estatus_Miembro,
    required DateTime fecha_Registro,
    DateTime? fecha_Ultima_Visita,
  }) : super(
          nivel: nivel,
          antiguedad: antiguedad,
          tipo: tipo,
          estatus_Membresia: estatus_Membresia,
          estatus_Miembro: estatus_Miembro,
          fecha_Registro: fecha_Registro,
          fecha_Ultima_Visita: fecha_Ultima_Visita,
        );

  // IMPORTANTE:(10B) Reescribir las propiedades del paciente y el metodo de cancelarMembresia()
  @override
  void cancelarMembresia(Miembro miembro) {
    print(
        'Membresía cancelada para el miembro registrado el ${miembro.fecha_Registro}.');

    final miembroActualizado = MiembroExTrabajador(
      nivel: miembro.nivel,
      antiguedad: miembro.antiguedad,
      tipo: miembro.tipo,
      estatus_Membresia: false,
      estatus_Miembro: miembro.estatus_Miembro,
      fecha_Registro: miembro.fecha_Registro,
      fecha_Ultima_Visita: miembro.fecha_Ultima_Visita,
    );
    
    actualizarMiembro(miembro, miembroActualizado);
  }
}
