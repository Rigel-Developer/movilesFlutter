import 'package:notasFinal/models/TipoUsuario.dart';

class Docente {
  int codigoDocente;
  String nombreDocente;
  String apellidoDocente;
  int dniDocente;
  int celDocente;
  String correoDocente;
  String contraDocente;
  String fechaDocente;
  TipoUsuario tipoUsuario;

  Docente(
      {this.codigoDocente,
      this.nombreDocente,
      this.apellidoDocente,
      this.dniDocente,
      this.celDocente,
      this.correoDocente,
      this.contraDocente,
      this.fechaDocente,
      this.tipoUsuario});

  factory Docente.fromJson(Map<String, dynamic> json) {
    return Docente(
      codigoDocente: json['codigoDocente'],
      nombreDocente: json['nombreDocente'],
      apellidoDocente: json['apellidoDocente'],
      dniDocente: json['dniDocente'],
      celDocente: json['celularDocenteo'],
      correoDocente: json['correoDocente'],
      contraDocente: json['contraDocente'],
      fechaDocente: json['fechaRegistroDocente'],
      tipoUsuario: TipoUsuario.fromJson(json['tipoUsuario']),
    );
  }
}
