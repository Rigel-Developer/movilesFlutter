import 'package:flutter/material.dart';
import 'package:notasFinal/main.dart';
import 'package:json_table/json_table.dart';
import 'dart:convert';

import 'package:notasFinal/notasAlumnoDocente.dart';

class SeccionHasAlumnos extends StatefulWidget {
  String jsonAlumnos;
  int codigoAsignatura;
  var columns = [
    JsonTableColumn("codigoAlumno", label: "Codigo"),
    JsonTableColumn("nombreAlumno", label: "Nombre"),
    JsonTableColumn("apellidoAlumno", label: "Apellido"),
    JsonTableColumn("dniAlumno", label: "DNI"),
    JsonTableColumn("correoAlumno", label: "Correo"),
    JsonTableColumn("carrera.nombreCarrera", label: "Carrera"),
  ];
  SeccionHasAlumnos(this.codigoAsignatura);
  @override
  _SeccionHasAlumnos createState() => _SeccionHasAlumnos();
}

class _SeccionHasAlumnos extends State<SeccionHasAlumnos> {
  @override
  void initState() {
    widget.jsonAlumnos = docenteService.alumnoDocenteCadena;
    print(widget.codigoAsignatura);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var json = jsonDecode(widget.jsonAlumnos);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Consulta de Horarios ",
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lista de Alumnos",
                    style: TextStyle(fontSize: 30),
                  ),
                  JsonTable(
                    json,
                    showColumnToggle: true,
                    allowRowHighlight: true,
                    rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                    paginationRowCount: 10,
                    columns: widget.columns,
                    onRowSelect: (index, map) {
                      int alumno = int.parse((map["codigoAlumno"].toString()));
                      Navigator.of(context).push(new MaterialPageRoute<Null>(
                        builder: (BuildContext pContexto) {
                          return new NotasAlumnoDocente(
                              alumno, widget.codigoAsignatura);
                        },
                      ));
                    },
                  )
                ])));
  }
}
