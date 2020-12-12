import 'package:notasFinal/main.dart';
import 'package:flutter/material.dart';

class ListaAlumnos extends StatefulWidget {
  @override
  _ListaAlumnos createState() => _ListaAlumnos();
}

class _ListaAlumnos extends State<ListaAlumnos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Column(children: <Widget>[
      Padding(padding: EdgeInsets.all(20)),
      Text(
        "Datos Personales",
        style: TextStyle(color: Colors.lightBlue, fontSize: 30),
        textAlign: TextAlign.center,
      ),
      new ListTile(
        leading: const Icon(Icons.person, color: Colors.lightBlue),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: docenteService.docente.nombreDocente +
                ' ' +
                docenteService.docente.apellidoDocente,
          ),
        ),
      ),
      new ListTile(
        leading: const Icon(
          Icons.phone,
          color: Colors.lightBlue,
        ),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: docenteService.docente.celDocente.toString(),
          ),
        ),
      ),
      new ListTile(
        leading: const Icon(
          Icons.credit_card,
          color: Colors.lightBlue,
        ),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: docenteService.docente.dniDocente.toString(),
          ),
        ),
      ),
      new ListTile(
        leading: const Icon(
          Icons.calendar_today,
          color: Colors.lightBlue,
        ),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: docenteService.docente.fechaDocente,
          ),
        ),
      ),
      new ListTile(
        leading: const Icon(
          Icons.email,
          color: Colors.lightBlue,
        ),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: docenteService.docente.correoDocente,
          ),
        ),
      ),
    ]));
  }
}
