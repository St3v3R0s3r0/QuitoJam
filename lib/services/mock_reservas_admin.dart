import 'package:quitojam_1/models/reservas_admin.dart';

List<ReservaAdmin> obtenerReservasAdminMock() {
  return [
    ReservaAdmin(
      id: 1,
      nombreSala: 'Sala Acústica Norte',
      nombreUsuario: 'Carlos Pérez',
      fechaInicio: DateTime.now().add(const Duration(days: 1, hours: 10)),
      fechaFin: DateTime.now().add(const Duration(days: 1, hours: 12)),
      estado: 'pendiente',
      comentarios: 'Traeré mi propia guitarra.',
    ),
    ReservaAdmin(
      id: 2,
      nombreSala: 'Estudio Pro Centro',
      nombreUsuario: 'Ana Gómez',
      fechaInicio: DateTime.now().add(const Duration(days: 2, hours: 14)),
      fechaFin: DateTime.now().add(const Duration(days: 2, hours: 16)),
      estado: 'confirmada',
      comentarios: null,
    ),
  ];
}
