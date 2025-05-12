import 'dart:ui';
import 'package:flutter/material.dart';
import '../../models/sala_model.dart';

class DetalleSalaScreen extends StatelessWidget {
  final Sala sala;

  const DetalleSalaScreen({super.key, required this.sala});

  static const yellow = Color(0xFFFFC400);
  static const grayDark = Color(0xFF2C2C2C);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          sala.nombre,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: yellow),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Imagen de fondo desenfocada
          if (sala.imagenes.isNotEmpty)
            Positioned.fill(
              child: Image.network(
                sala.imagenes.first,
                fit: BoxFit.cover,
              ),
            ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.black.withOpacity(0.6)),
            ),
          ),

          // Contenido principal
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 📸 Galería horizontal con scroll deslizable
                    SizedBox(
                      height: 250,
                      child: ScrollConfiguration(
                        behavior:
                            const ScrollBehavior().copyWith(overscroll: false),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: sala.imagenes.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                sala.imagenes[index],
                                height: 250,
                                width: screenWidth < 600 ? 280 : 400,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Detalles
                    Text(
                      sala.nombre,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: yellow,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${sala.precioPorHora.toStringAsFixed(2)} / hora',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      sala.descripcion,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Simulación de reserva'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: yellow,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Reservar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
