class ReservaAdmin {
  final int id;
  final String nombreSala;
  final String nombreUsuario;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final String estado;
  final String? comentarios;

  ReservaAdmin({
    required this.id,
    required this.nombreSala,
    required this.nombreUsuario,
    required this.fechaInicio,
    required this.fechaFin,
    required this.estado,
    this.comentarios,
  });
}
