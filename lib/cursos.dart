import 'package:flutter/material.dart';
import 'package:notasFinal/itemCurso.dart';
import 'package:notasFinal/main.dart';

class Curso extends StatefulWidget {
  Curso({Key key}) : super(key: key);

  @override
  _Curso createState() => _Curso();
}

class _Curso extends State<Curso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cursos'),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount:
            appAuth.listaSeccion2 == null ? 0 : appAuth.listaSeccion2.length,
        itemBuilder: (BuildContext context, int i) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      appAuth.listaSeccion2[i].asignatura.codigoAsignatura
                          .toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      appAuth.listaSeccion2[i].asignatura.nombreAsignatura,
                      style: TextStyle(color: Colors.lightBlue, fontSize: 17),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.green,
                          size: 30,
                        ),
                        onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => ItemCurso(
                                      appAuth.alumno.codigo,
                                      appAuth.listaSeccion2[i].asignatura
                                          .codigoAsignatura)))
                            })
                  ],
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
