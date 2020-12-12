import 'package:flutter/material.dart';
import 'package:notasFinal/SeccionHasAlumnos.dart';
import 'package:notasFinal/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListaSeccion extends StatefulWidget {
  @override
  _ListaSeccion createState() => _ListaSeccion();
}

class _ListaSeccion extends State<ListaSeccion> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: docenteService.seccionDocenteArray.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.all(15),
          leading: Icon(Icons.grade, color: Colors.lightBlue),
          title: Text(docenteService.seccionDocenteArray[index]
                  .nombreCodigoSeccion.nombreSeccion +
              ' - ' +
              docenteService
                  .seccionDocenteArray[index].asignatura.nombreAsignatura),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.green),
          onTap: () {
            docenteService
                .getAlumnosXSeccion(docenteService.seccionDocenteArray[index]
                    .nombreCodigoSeccion.codigoSeccion)
                .then((value) => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SeccionHasAlumnos(
                              docenteService.seccionDocenteArray[index]
                                  .asignatura.codigoAsignatura)))
                    });
          },
        );
      },
    );
  }
}
