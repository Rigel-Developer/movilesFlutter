import 'dart:convert';

class Carrera {
  int codigoCarrera;
  String nombreCarrera;

  Carrera({this.codigoCarrera, this.nombreCarrera});

  factory Carrera.fromJson(Map<String, dynamic> json) {
    return Carrera(
      codigoCarrera: json['codigoCarrera'],
      nombreCarrera: json['nombreCarrera'],
    );
  }
}
