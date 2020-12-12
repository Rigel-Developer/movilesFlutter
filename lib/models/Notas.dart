import 'package:notasFinal/models/Alumno.dart';
import 'package:notasFinal/models/Asignatura.dart';
import 'dart:convert';

class Notas {
  Asignatura asignatura;
  Alumno alumno;
  double caso1;
  double caso2;
  double caso3;
  double virtual;
  double notaFinal;

  Notas(
      {this.alumno,
      this.asignatura,
      this.caso1,
      this.caso2,
      this.caso3,
      this.virtual,
      this.notaFinal});
  Notas.empty();
  Notas.update(
      this.caso1, this.caso2, this.caso3, this.virtual, this.notaFinal);

  factory Notas.fromJson(Map<String, dynamic> json) {
    return Notas(
        asignatura: Asignatura.fromJson(json['asignatura']),
        alumno: Alumno.fromJson(json['alumno']),
        caso1: json['caso_1'],
        caso2: json['caso_2'],
        caso3: json['caso_3'],
        virtual: json['casoVirtual'],
        notaFinal: json['notaFinal']);
  }
  Map<String, dynamic> toJson() {
    return {
      "asignatura": asignatura,
      "alumno": alumno,
      "caso_1": caso1,
      "caso_2": caso2,
      "caso_3": caso3,
      "casoVirtual": virtual,
      "notaFinal": notaFinal
    };
  }

  String notasToJson(Notas notas) {
    final jsonData = notas.toJson();
    return json.encode(jsonData);
  }
}
