import 'package:flutter/material.dart';
import 'package:notasFinal/horarioAlumno.dart';
import 'package:notasFinal/loginPage.dart';
import 'package:notasFinal/main.dart';
import 'package:notasFinal/cursos.dart';
import 'package:notasFinal/widgets/CustomDialog.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //dialog para salir de la sesion
    var logoutAlumno = CustomAlertDialog(
      title: "Salir de la sesión",
      message: "¿Estas seguro que desea terminar la sesión?",
      positiveBtnText: "Si",
      negativeBtnText: "No",
      onPostivePressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false);
        /* Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => new LoginPage()));*/
      },
    );

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
              color: Colors.lightBlue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.input, color: Colors.lightBlue),
            title: Text('Bienvenido'),
            onTap: () => {},
          ),
          Divider(),
          ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.lightBlue,
              ),
              title: Text('Horarios'),
              onTap: () => {
                    //appAuth.getHorarioXAlumno(codigo),
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => HorarioAlumno()))
                  }),
          Divider(),
          ListTile(
            leading: Icon(Icons.book, color: Colors.lightBlue),
            title: Text('Cursos'),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Curso()))
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.lightBlue),
            title: Text('Logout'),
            onTap: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => logoutAlumno)

              /* */
            },
          ),
        ],
      ),
    );
  }
}
