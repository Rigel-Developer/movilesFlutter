import 'package:notasFinal/models/Asignatura.dart';
import 'package:notasFinal/models/CodigoSeccion.dart';
import 'package:notasFinal/models/Docente.dart';
import 'package:notasFinal/models/Horario.dart';

class Seccion {
  int codigoSeccion;
  int vacantes;
  int libres;
  Horario horario;
  Docente docente;
  CodigoSeccion nombreCodigoSeccion;
  Asignatura asignatura;

  Seccion(
      {this.codigoSeccion,
      this.vacantes,
      this.libres,
      this.horario,
      this.docente,
      this.nombreCodigoSeccion,
      this.asignatura});

  factory Seccion.fromJson(Map<String, dynamic> json) {
    return Seccion(
        codigoSeccion: json['codigoSeccion'],
        vacantes: json['vacantesSeccion'],
        libres: json['libresSeccion'],
        horario: Horario.fromJson(json['horario']),
        docente: Docente.fromJson(json['docente']),
        nombreCodigoSeccion: CodigoSeccion.fromJson(json['seccion_code']),
        asignatura: Asignatura.fromJson(json['asignatura']));
  }
}
