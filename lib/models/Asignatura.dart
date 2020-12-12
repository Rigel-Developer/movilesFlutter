import 'package:notasFinal/models/Carrera.dart';
import 'package:notasFinal/models/Semestre.dart';

class Asignatura {
  int codigoAsignatura;
  String nombreAsignatura;
  Semestre semestre;
  Carrera carrera;

  Asignatura(
      {this.codigoAsignatura,
      this.nombreAsignatura,
      this.semestre,
      this.carrera});

  factory Asignatura.fromJson(Map<String, dynamic> json) {
    return Asignatura(
      codigoAsignatura: json['codigoAsignatura'],
      nombreAsignatura: json['nombreAsignatura'],
      semestre: Semestre.fromJson(json['semestre']),
      carrera: Carrera.fromJson(json['carrera']),
    );
  }
}
