class SalaDeEnsayo {
  final int id;
  final String nombre;
  final String ubicacion;
  final double precioPorHora;
  final int capacidad;
  final String descripcion;
  final List<String> fotos;

  SalaDeEnsayo({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.precioPorHora,
    required this.capacidad,
    required this.descripcion,
    required this.fotos,
  });
}
