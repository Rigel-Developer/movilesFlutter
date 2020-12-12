import 'package:flutter/material.dart';
import 'package:notasFinal/main.dart';
import 'package:notasFinal/widgets/nav-drawer.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appAuth.getHorarioXAlumno(appAuth.alumno.codigo);
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Menú de Inicio'),
        ),
        body: new Column(children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.codigo.toString(),
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.book),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.nombre,
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.book),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.apellido,
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.cel.toString(),
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.credit_card),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.dni.toString(),
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.calendar_today),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.fecha,
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.correo,
              ),
            ),
          ),
        ]));
  }
}
