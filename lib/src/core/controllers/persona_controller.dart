import 'package:appnotas/src/core/models/persona.dart';

class PersonaController {
  final Persona persona;
  PersonaController(this.persona);

  void cambiarNombre(String nombre) {
    persona.nombre = nombre;
  }
}
