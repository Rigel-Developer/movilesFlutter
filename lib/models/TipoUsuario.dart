class TipoUsuario {
  int codigoTipoUsuario;
  String nombreTipo;

  TipoUsuario({this.codigoTipoUsuario, this.nombreTipo});

  factory TipoUsuario.fromJson(Map<String, dynamic> json) {
    return TipoUsuario(
      codigoTipoUsuario: json['codigoTipoUsuario'],
      nombreTipo: json['descripcionTipoUsuario'],
    );
  }
}
