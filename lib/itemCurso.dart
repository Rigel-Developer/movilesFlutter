import 'package:flutter/material.dart';
import 'package:notasFinal/main.dart';
import 'package:notasFinal/models/Notas.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart' show Future;
import 'dart:convert';

class ItemCurso extends StatefulWidget {
  int codigoCurso;
  int codigoAlumno;
  Notas notas;
  ItemCurso(this.codigoAlumno, this.codigoCurso);

  @override
  _ItemCurso createState() => _ItemCurso();
}

class _ItemCurso extends State<ItemCurso> {
  final _tfCaso1 = TextEditingController();
  final _tfCaso2 = TextEditingController();
  final _tfCaso3 = TextEditingController();
  final _tfVirtual = TextEditingController();
  final _tfFinal = TextEditingController();

  @override
  void initState() {
    print(widget.codigoAlumno);
    if (widget.codigoCurso > 0) {
      getNotasXCurso(widget.codigoAlumno, widget.codigoCurso);
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Menú de Inicio'),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child:
                  Text("Codigo de Alumno:" + appAuth.alumno.codigo.toString()),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: <Widget>[
                  TextField(
                      controller: _tfCaso1,
                      decoration: InputDecoration(
                        //hintText: "Ingresar Nombre Cliente",
                        labelText: "Caso 1",
                        /*errorText: _tfNombreCliente.text.toString() == ""
                            ? "Falta ingresar la Nombre del Cliente"
                            : null,*/
                      )),
                  TextField(
                      controller: _tfCaso2,
                      decoration: InputDecoration(
                        //hintText: "Ingresar Numero de Orden de Servicio",
                        labelText: "Caso 2",
                        /*errorText: _tfNumeroOrdenServicio.text.toString() == ""
                            ? "Falta ingresar el NumeroOrdenServicio"
                            : null,*/
                      )),
                  TextField(
                      controller: _tfCaso3,
                      decoration: InputDecoration(
                        // hintText: "Ingresar FechaProgramada",
                        labelText: "Caso 3",
                      )),
                  TextField(
                      controller: _tfVirtual,
                      decoration: InputDecoration(
                        // hintText: "Ingresar Linea",
                        labelText: "Caso virtual",
                      )),
                  TextField(
                      controller: _tfFinal,
                      decoration: InputDecoration(
                        //  hintText: "Ingresar Estado",
                        labelText: "Caso final",
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
