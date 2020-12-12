import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart' show Future;
import 'package:notasFinal/models/Alumno.dart';
import 'package:notasFinal/models/Horario.dart';
import 'package:notasFinal/models/Notas.dart';
import 'package:notasFinal/models/Seccion.dart';

class AlumnoService {
  String urlGeneral = 'http://localhost:8090';
  String urlAlumno = '/alumno';
  String urlDocente = '/docente';
  int codigo = 0;
  Alumno alumno;
  Horario horario;
  String listaSeccion;
  List<Seccion> listaSeccion2;
  Notas listaNotas;
  //genymotion http://10.0.3.2:8090/alumno/login/

  Future<bool> loginUsuario(String user, String pass) async {
    bool estado;
    http.Response response = await http
        .get('http://10.0.3.2:8090/alumno/login/' + user + '/' + pass);
    print("Codigo ---> " + response.statusCode.toString());
    if (response.statusCode == 200) {
      alumno = Alumno.fromJson(json.decode(response.body));
      estado = true;
    } else if (response.statusCode == 404) {
      estado = false;
    }

    return estado;
  }

  Future<String> getHorarioXAlumno(int codigo) async {
    http.Response response = await http.get(
        'http://10.0.3.2:8090/alumno/verSeccioXAlumno/' + codigo.toString());

    listaSeccion2 = List<Seccion>.from(
        json.decode(response.body).map((x) => Seccion.fromJson(x)));
    for (var item in listaSeccion2) {
      print(item.asignatura.nombreAsignatura);
    }

    listaSeccion = response.body;

    return "hecho";
  }

  /*Future<String> getNotasXCurso(int alumno, int curso) async {
    http.Response response = await http.get(
        'http://10.0.3.2:8090/alumno/verNotasXCurso/' +
            alumno.toString() +
            '/' +
            curso.toString());
    listaNotas = Notas.fromJson(json.decode(response.body));
    debugPrint(listaNotas.caso1.toString());
    debugPrint(listaNotas.caso2.toString());
    debugPrint(listaNotas.caso3.toString());
    return "notas";
  }*/

  void saludar() {}
}
