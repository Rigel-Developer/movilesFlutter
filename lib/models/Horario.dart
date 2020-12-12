class Horario {
  int codigoHorario;
  String turnoHorario;
  String diaHorario;
  String horaInicio;
  String horaFin;

  Horario(
      {this.codigoHorario,
      this.turnoHorario,
      this.diaHorario,
      this.horaInicio,
      this.horaFin});

  factory Horario.fromJson(Map<String, dynamic> json) {
    return Horario(
        codigoHorario: json['codigoHorario'],
        turnoHorario: json['turnoHorario'],
        diaHorario: json['diaHorario'],
        horaInicio: json['horaInicioHorario'],
        horaFin: json['horaFinHorario']);
  }
}
