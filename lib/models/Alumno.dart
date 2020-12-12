import 'package:notasFinal/models/Semestre.dart';
import 'package:notasFinal/models/Carrera.dart';
import 'package:notasFinal/models/TipoUsuario.dart';

class Alumno {
  int codigo;
  int estado;
  String nombre;
  String apellido;
  int dni;
  int cel;
  String correo;
  String contra;
  String fecha;
  Semestre semestre;
  Carrera carrera;
  TipoUsuario tipoUsuario;

  void inicializar() {
    this.codigo = 0;
    this.estado = 0;
    this.nombre = "";
    this.apellido = "";
    this.dni = 0;
    this.cel = 0;
    this.correo = "";
    this.contra = "";
    this.fecha = "";
    this.semestre = new Semestre();
    this.carrera = new Carrera();
    this.tipoUsuario = new TipoUsuario();
  }

  Alumno(
      {this.codigo,
      this.estado,
      this.nombre,
      this.apellido,
      this.dni,
      this.cel,
      this.correo,
      this.contra,
      this.fecha,
      this.semestre,
      this.carrera,
      this.tipoUsuario});

  factory Alumno.fromJson(Map<String, dynamic> json) {
    return Alumno(
        codigo: json['codigoAlumno'],
        estado: json['estadoMatri'],
        nombre: json['nombreAlumno'],
        apellido: json['apellidoAlumno'],
        dni: json['dniAlumno'],
        cel: json['celularAlumno'],
        correo: json['correoAlumno'],
        contra: json['contraAlumno'],
        fecha: json['fechaRegistroAlumno'],
        semestre: Semestre.fromJson(json['semestre']),
        carrera: Carrera.fromJson(json['carrera']),
        tipoUsuario: TipoUsuario.fromJson(json['tipoUsuario']));
  }
}
