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
              child: Text(
                "Listado de Notas",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: Colors.indigo,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: <Widget>[
                  new ListTile(
                    leading: Text(
                      "Caso 1",
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    ),
                    title: new TextField(
                      controller: _tfCaso1,
                      decoration: new InputDecoration(hintText: "Bienvenido"),
                    ),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.lightBlue,
                    ),
                  ),
                  new ListTile(
                    leading: Text(
                      "Caso 2",
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    ),
                    title: new TextField(
                      controller: _tfCaso2,
                      decoration: new InputDecoration(hintText: "Bienvenido"),
                    ),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.lightBlue,
                    ),
                  ),
                  new ListTile(
                    leading: Text(
                      "Caso 3",
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    ),
                    title: new TextField(
                      controller: _tfCaso3,
                      decoration: new InputDecoration(hintText: "Bienvenido"),
                    ),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.lightBlue,
                    ),
                  ),
                  new ListTile(
                    leading: Text(
                      "Caso 4",
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    ),
                    title: new TextField(
                      controller: _tfVirtual,
                      decoration: new InputDecoration(hintText: "Bienvenido"),
                    ),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.lightBlue,
                    ),
                  ),
                  new ListTile(
                    leading: Text(
                      "Caso 5",
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    ),
                    title: new TextField(
                      controller: _tfVirtual,
                      decoration: new InputDecoration(hintText: "Bienvenido"),
                    ),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
