import 'package:notasFinal/listaAlumnos.dart';
import 'package:notasFinal/loginPage.dart';
import 'package:notasFinal/main.dart';
import 'package:flutter/material.dart';
import 'package:notasFinal/widgets/CustomDialog.dart';

import 'ListaSeccion.dart';

class LoginDocente extends StatefulWidget {
  @override
  _LoginDocente createState() => _LoginDocente();
}

class _LoginDocente extends State<LoginDocente> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ListaAlumnos(),
    ListaSeccion(),
    LoginPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    docenteService.getSeccionXDocente(docenteService.docente.codigoDocente);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Docente'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Seccion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Salir',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
