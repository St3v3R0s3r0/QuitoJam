import '../models/sala_model.dart';

List<Sala> obtenerSalasMock() {
  return [
    Sala(
      nombre: 'LiveRoom Sessions',
      descripcion:
          'Sala de Ensayo y grabación, contamos con equipos musicales y de amplificación.',
      precioPorHora: 13.0,
      imagenes: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuXpzgVH3SKwZp0-57SvsKyLyNatDCpIEP4w&s',
        'https://es.rollingstone.com/wp-content/uploads/2021/11/Line-Up-salas-de-ensayo-la-musica-merece-los-mejores-espacios.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd7PG4Z1qLr0Q9Nr7-qAOMttaQdlZkPo0s9A&s',
      ],
    ),
    // Puedes agregar más

    Sala(
      nombre: 'Expresarte',
      descripcion: 'Sala de Ensayo, contamos con instrumentos y amplificación.',
      precioPorHora: 13.0,
      imagenes: [
        'https://es.rollingstone.com/wp-content/uploads/2021/11/Line-Up-salas-de-ensayo-la-musica-merece-los-mejores-espacios.jpg',
        'https://salaslpm.com/imagenes/sala1/Sala-1-1-1.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd7PG4Z1qLr0Q9Nr7-qAOMttaQdlZkPo0s9A&s',
      ],
    ),
  ];
}
