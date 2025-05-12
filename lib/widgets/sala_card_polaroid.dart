import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;
import '../models/sala_model.dart';

class SalaCardPolaroid extends StatelessWidget {
  final Sala sala;
  final VoidCallback onTap;

  const SalaCardPolaroid({super.key, required this.sala, required this.onTap});

  static const yellow = Color(0xFFFFC400);
  static const grayDark = Color(0xFF2C2C2C);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        constraints:
            const BoxConstraints(maxWidth: 400), // ancho máximo en desktop
        padding: const EdgeInsets.all(10),
        child: Card(
          color: grayDark,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9, // Mantener proporción estándar
                    child: cs.CarouselSlider(
                      items: sala.imagenes.map((url) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(url,
                              fit: BoxFit.cover, width: double.infinity),
                        );
                      }).toList(),
                      options: cs.CarouselOptions(
                        viewportFraction: 1.0,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(Icons.star_border, color: yellow, size: 30),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sala.nombre,
                      style: const TextStyle(
                          color: yellow,
                          fontSize: 16,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 4),
                    Text('\$${sala.precioPorHora.toStringAsFixed(0)} /hr',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(sala.descripcion,
                        style: const TextStyle(color: Colors.white70)),
                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: yellow,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: onTap,
                        child: const Text('Reservar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
