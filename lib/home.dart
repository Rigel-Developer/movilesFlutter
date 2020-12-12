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
          Container(
              padding: EdgeInsets.all(20),
              child: Text("Datos personales",
                  style: TextStyle(fontSize: 30, color: Colors.lightBlue))),
          Divider(),
          new ListTile(
            leading: const Icon(Icons.person, color: Colors.green),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.codigo.toString(),
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.book, color: Colors.green),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.nombre,
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.grade, color: Colors.green),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.apellido,
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone, color: Colors.green),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.cel.toString(),
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.credit_card, color: Colors.green),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.dni.toString(),
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.green),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.fecha,
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email, color: Colors.green),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.correo,
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.school, color: Colors.green),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: appAuth.alumno.carrera.nombreCarrera,
              ),
            ),
          ),
        ]));
  }
}
