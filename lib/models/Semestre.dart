class Semestre {
  int codigoSemestre;
  String nombreSemestre;

  Semestre({this.codigoSemestre, this.nombreSemestre});

  factory Semestre.fromJson(Map<String, dynamic> json) {
    return Semestre(
      codigoSemestre: json['codigoSemestre'],
      nombreSemestre: json['nombreSemestre'],
    );
  }
}
