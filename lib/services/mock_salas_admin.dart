import '../models/sala_admin_model.dart';

List<SalaDeEnsayo> obtenerSalasDelAdminMock() {
  return [
    SalaDeEnsayo(
      id: 1,
      nombre: 'LiveRoom Sessions',
      ubicacion: 'Av. de los Shyris y Naciones Unidas',
      precioPorHora: 13.00,
      capacidad: 5,
      descripcion:
          'Aislamiento acústico, ideal para ensayos de bandas pequeñas.',
      fotos: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuXpzgVH3SKwZp0-57SvsKyLyNatDCpIEP4w&s',
        'https://es.rollingstone.com/wp-content/uploads/2021/11/Line-Up-salas-de-ensayo-la-musica-merece-los-mejores-espacios.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd7PG4Z1qLr0Q9Nr7-qAOMttaQdlZkPo0s9A&s',
      ],
    ),
    // más salas...
  ];
}
