import 'package:flutter/material.dart';
import 'package:notasFinal/home.dart';
import 'package:notasFinal/homeDocente.dart';
import 'models/Alumno.dart';
import 'package:notasFinal/main.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  Alumno dataAlumno;

  void _nuevoCliente() {
    Navigator.of(context)
        .push(new MaterialPageRoute<Null>(builder: (BuildContext pContexto) {
      return new Home();
    }));
  }

  void _nuevoDocente() {
    Navigator.of(context)
        .push(new MaterialPageRoute<Null>(builder: (BuildContext pContexto) {
      return new LoginDocente();
    }));
  }

  void _login() {
    var user = _nameController.text;
    var pass = _passwordController.text;
    //print(user + ' ' + pass);
    appAuth.loginUsuario(user, pass).then((value) => {
          if (value)
            {_nuevoCliente()}
          else
            {
              docenteService.loginDocente(user, pass).then((value) => {
                    if (value)
                      {_nuevoDocente()}
                    else
                      {
                        Toast.show("Usuario no registrado", context,
                            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER)
                      }
                  })
            }
        });
    //docenteService.loginDocente(user, pass)
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Inicio de Sesión',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Contraseña'),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () {
                    _login();
                  },
                )),
          ],
        ),
      ));
}
