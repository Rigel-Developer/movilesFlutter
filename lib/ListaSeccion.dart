import 'package:flutter/material.dart';
import 'package:notasFinal/SeccionHasAlumnos.dart';
import 'package:notasFinal/main.dart';

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
          leading: Icon(Icons.grade),
          title: Text(docenteService.seccionDocenteArray[index]
                  .nombreCodigoSeccion.nombreSeccion +
              ' - ' +
              docenteService
                  .seccionDocenteArray[index].asignatura.nombreAsignatura),
          trailing: Icon(
            Icons.keyboard_arrow_right,
          ),
          onTap: () {
            docenteService.getAlumnosXSeccion(docenteService
                .seccionDocenteArray[index].nombreCodigoSeccion.codigoSeccion);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => SeccionHasAlumnos(
                    docenteService.seccionDocenteArray[index].asignatura
                        .codigoAsignatura)));
          },
        );
      },
    );
  }
}
