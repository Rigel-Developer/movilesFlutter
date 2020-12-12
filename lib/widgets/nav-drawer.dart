import 'package:flutter/material.dart';
import 'package:notasFinal/horarioAlumno.dart';
import 'package:notasFinal/main.dart';
import 'package:notasFinal/cursos.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int codigo = appAuth.alumno.codigo;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              appAuth.alumno.nombre,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Bienvenido'),
            onTap: () => {},
          ),
          ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Horarios'),
              onTap: () => {
                    //appAuth.getHorarioXAlumno(codigo),
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => HorarioAlumno()))
                  }),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Cursos'),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Curso()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
