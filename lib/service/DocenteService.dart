import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart' show Future;
import 'package:notasFinal/models/Alumno.dart';
import 'package:notasFinal/models/Docente.dart';
import 'package:notasFinal/models/Seccion.dart';

class DocenteService {
  Docente docente;
  List<Seccion> seccionDocenteArray;
  String seccionDocenteCadena;
  //alumno
  Alumno alumno;
  List<Alumno> alumnoDocenteArray;
  String alumnoDocenteCadena;

  Future<bool> loginDocente(String user, String pass) async {
    bool estado;
    http.Response response = await http
        .get('http://10.0.3.2:8090/docente/loginDocente/' + user + '/' + pass);
    if (response.statusCode == 200) {
      docente = Docente.fromJson(json.decode(response.body));
      estado = true;
    } else if (response.statusCode == 404) {
      estado = false;
    }
    return estado;
  }

  Future<String> getSeccionXDocente(int codigo) async {
    http.Response response = await http.get(
        'http://10.0.3.2:8090/alumno/verSeccioXDocente/' + codigo.toString());

    seccionDocenteArray = List<Seccion>.from(
        json.decode(response.body).map((x) => Seccion.fromJson(x)));
    for (var item in seccionDocenteArray) {
      print(item.asignatura.nombreAsignatura);
    }

    seccionDocenteCadena = response.body;

    return "hecho";
  }

  Future<String> getAlumnosXSeccion(int codigo) async {
    http.Response response = await http.get(
        'http://10.0.3.2:8090/alumno/buscarAlumnoXSeccion/' +
            codigo.toString());

    alumnoDocenteArray = List<Alumno>.from(
        json.decode(response.body).map((x) => Alumno.fromJson(x)));

    alumnoDocenteCadena = response.body;

    return "hecho";
  }
}
