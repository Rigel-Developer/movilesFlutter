import 'package:flutter/material.dart';
import 'package:notasFinal/SeccionHasAlumnos.dart';
import 'package:notasFinal/main.dart';
import 'package:notasFinal/models/Notas.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart' show Future;
import 'dart:convert';

import 'package:notasFinal/widgets/CustomDialog.dart';

class NotasAlumnoDocente extends StatefulWidget {
  int codigoCurso;
  int codigoAlumno;
  Notas notas;
  Notas sendNotas;
  NotasAlumnoDocente(this.codigoAlumno, this.codigoCurso);

  @override
  _NotasAlumnoDocente createState() => _NotasAlumnoDocente();
}

class _NotasAlumnoDocente extends State<NotasAlumnoDocente> {
  final _tfCaso1 = TextEditingController();
  final _tfCaso2 = TextEditingController();
  final _tfCaso3 = TextEditingController();
  final _tfVirtual = TextEditingController();
  final _tfFinal = TextEditingController();

  @override
  void initState() {
    if (widget.codigoCurso > 0) {
      getNotasXCurso(widget.codigoAlumno, widget.codigoCurso);
    }
  }

  Future<bool> updateProfile(Notas data) async {
    print(data.notaFinal);

    final response = await http.put(
      'http://10.0.3.2:8090/alumno/updateNotas/' +
          widget.codigoAlumno.toString() +
          '/' +
          widget.codigoCurso.toString(),
      headers: {"content-type": "application/json"},
      body: notas.notasToJson(data),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getNotasXCurso(int alumno, int curso) async {
    http.Response response = await http.get(
        'http://10.0.3.2:8090/alumno/verNotasXCurso/' +
            alumno.toString() +
            '/' +
            curso.toString());

    setState(() {
      widget.notas = Notas.fromJson(json.decode(response.body));
      _mostrarNotas();
    });

    return "notas";
  }

  void _mostrarNotas() {
    _tfCaso1.text = widget.notas.caso1.toString();
    _tfCaso2.text = widget.notas.caso2.toString();
    _tfCaso3.text = widget.notas.caso3.toString();
    _tfVirtual.text = widget.notas.virtual.toString();
    _tfFinal.text = widget.notas.notaFinal.toString();
  }

  @override
  Widget build(BuildContext context) {
    var updateNotas = CustomAlertDialog(
      title: "Actualizar Notas",
      message:
          "¿Estas seguro que desea actualizar las notas del alumno ${widget.codigoAlumno}",
      positiveBtnText: "Si",
      negativeBtnText: "No",
      onPostivePressed: () {
        Notas n = new Notas.update(
            double.parse(_tfCaso1.text),
            double.parse(_tfCaso2.text),
            double.parse(_tfCaso3.text),
            double.parse(_tfVirtual.text),
            double.parse(_tfFinal.text));

        updateProfile(n);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => SeccionHasAlumnos(widget.codigoCurso)),
            (Route<dynamic> route) => false);
        /* Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => new LoginPage()));*/
      },
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Actualizacion de Notas'),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Listado de Notas",
                  style: TextStyle(color: Colors.lightBlue, fontSize: 30),
                  textAlign: TextAlign.center),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: <Widget>[
                  TextField(
                      controller: _tfCaso1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        //hintText: "Ingresar Nombre Cliente",
                        labelText: "Caso 1",
                        /*errorText: _tfNombreCliente.text.toString() == ""
                            ? "Falta ingresar la Nombre del Cliente"
                            : null,*/
                      )),
                  TextField(
                      controller: _tfCaso2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        //hintText: "Ingresar Numero de Orden de Servicio",
                        labelText: "Caso 2",
                        /*errorText: _tfNumeroOrdenServicio.text.toString() == ""
                            ? "Falta ingresar el NumeroOrdenServicio"
                            : null,*/
                      )),
                  TextField(
                      controller: _tfCaso3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // hintText: "Ingresar FechaProgramada",
                        labelText: "Caso 3",
                      )),
                  TextField(
                      controller: _tfVirtual,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // hintText: "Ingresar Linea",
                        labelText: "Caso virtual",
                      )),
                  TextField(
                      controller: _tfFinal,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        //  hintText: "Ingresar Estado",
                        labelText: "Caso final",
                      )),
                  RaisedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => updateNotas);
                    },
                    child: Text("Grabar"),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
