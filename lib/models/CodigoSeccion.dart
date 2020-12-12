class CodigoSeccion {
  int codigoSeccion;
  String nombreSeccion;

  CodigoSeccion({this.codigoSeccion, this.nombreSeccion});

  factory CodigoSeccion.fromJson(Map<String, dynamic> json) {
    return CodigoSeccion(
        codigoSeccion: json['codigoSeccion'],
        nombreSeccion: json['descripcion_codigo']);
  }
}
