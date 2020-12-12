import 'package:flutter/cupertino.dart';
import 'package:json_table/json_table.dart';
import 'package:flutter/material.dart';
import 'package:notasFinal/main.dart';
import 'dart:convert';
import 'package:notasFinal/models/Horario.dart';
import 'package:notasFinal/models/Seccion.dart';
import 'package:notasFinal/service/AlumnoService.dart';

class HorarioAlumno extends StatefulWidget {
  String jsonHorarios =
      '''[{"codigoSeccion": 0,"vacantesSeccion":0,"libresSeccion": 0,
      "seccion_code": {"codigoSeccion": 0,"descripcion_codigo": ""},
      "docente": {"codigoDocente": 0,"nombreDocente": "","apellidoDocente": "","dniDocente": 0,"celularDocenteo": 0,"correoDocente": "","contraDocente": "","fechaRegistroDocente": "",
      "tipoUsuario": {"codigoTipoUsuario": 0,"descripcionTipoUsuario": ""}},
      "horario": {"codigoHorario": 0,"turnoHorario": "","diaHorario": "","horaInicioHorario": "","horaFinHorario": ""},
      "asignatura": {"codigoAsignatura": 0,"nombreAsignatura": "",
      "semestre": {"codigoSemestre": 0,"nombreSemestre": ""},
      "carrera": {"codigoCarrera": 0,"nombreCarrera": ""}}}]''';
  List<Seccion> lista;

  var columns = [
    JsonTableColumn("horario.codigoHorario", label: "Codigo"),
    JsonTableColumn("horario.turnoHorario", label: "Turno"),
    JsonTableColumn("horario.diaHorario", label: "Día"),
    JsonTableColumn("horario.horaInicioHorario", label: "Inicio"),
    JsonTableColumn("horario.horaFinHorario", label: "Fin"),
    JsonTableColumn("asignatura.nombreAsignatura", label: "Curso"),
    JsonTableColumn("seccion_code.descripcion_codigo", label: "Seccion"),
  ];
  @override
  _HorarioAlumno createState() => _HorarioAlumno();
}

class _HorarioAlumno extends State<HorarioAlumno> {
  @override
  void initState() {
    //widget.jsonHorarios = appAuth.getHorarioXAlumno(1);
    widget.jsonHorarios = appAuth.listaSeccion;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var json = jsonDecode(widget.jsonHorarios);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Consulta de Horarios ",
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lista de Horarios",
                    style: TextStyle(fontSize: 40, color: Colors.lightBlue),
                  ),
                  Padding(padding: EdgeInsets.all(25)),
                  Divider(),
                  JsonTable(
                    json,
                    showColumnToggle: true,
                    allowRowHighlight: true,
                    rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                    paginationRowCount: 10,
                    columns: widget.columns,
                    onRowSelect: (index, map) {
                      /*widget.codigoClienteSeleccionado =
                          int.parse(map["CodigoServicio"].toString());
                      print(widget.codigoClienteSeleccionado);
                      Navigator.of(context).push(new MaterialPageRoute<Null>(
                          builder: (BuildContext pContexto) {
                        return new NuevoServicio(
                            "Nuevo Cliente ", widget.codigoClienteSeleccionado);
                      }));*/
                      //_verRegistroCliente();
                    },
                  )
                ])));
  }
}
