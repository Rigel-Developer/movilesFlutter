import 'package:notasFinal/models/Alumno.dart';
import 'package:notasFinal/models/Seccion.dart';

class Matricula {
  Alumno alumno;
  Seccion seccion;

  Matricula({this.alumno, this.seccion});

  factory Matricula.fromJson(Map<String, dynamic> json) {
    return Matricula(
      alumno: Alumno.fromJson(json['alumno']),
      seccion: Seccion.fromJson(json['seccion']),
    );
  }
}
