import 'package:flutter/material.dart';

import 'package:notasFinal/SeccionHasAlumnos.dart';
import 'package:notasFinal/loginPage.dart';
import 'package:notasFinal/models/Notas.dart';

import 'package:notasFinal/service/AlumnoService.dart';
import 'package:notasFinal/service/DocenteService.dart';

AlumnoService appAuth = new AlumnoService();
DocenteService docenteService = new DocenteService();
Notas notas = new Notas();

void main() async {
  Widget _defaultHome = new LoginPage();

  runApp(new MaterialApp(title: 'App', home: _defaultHome));
}
