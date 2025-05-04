import 'package:flutter/material.dart';
import 'package:quitojam_1/widgets/custom_drawer.dart';
import 'package:quitojam_1/styles/colors/colors.dart'; // Importa tu clase de colores

class ShowRoomsScreen extends StatelessWidget {
  const ShowRoomsScreen({super.key});

  final List<Map<String, String>> salas = const [
    {
      'nombre': 'Sala Reverb',
      'ubicacion': 'Centro Histórico, Quito',
      'descripcion':
          'Espacio acústico para bandas pequeñas con equipos básicos.',
    },
    {
      'nombre': 'Estudio Decibel',
      'ubicacion': 'La Floresta, Quito',
      'descripcion':
          'Sala profesional con consola, micrófonos y cabinas de grabación.',
    },
    {
      'nombre': 'Sound Garage',
      'ubicacion': 'Carcelén, Quito',
      'descripcion':
          'Amplia sala para ensayos en vivo, ideal para grupos grandes.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(isAuthenticated: true),
      appBar: AppBar(
        backgroundColor: AppColors.skyline,
        title: const Text(
          'Buscar salas de ensayo',
          style: TextStyle(color: AppColors.brightLights),
        ),
        iconTheme: const IconThemeData(color: AppColors.brightLights),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: salas.length,
        itemBuilder: (context, index) {
          final sala = salas[index];
          return Card(
            color: AppColors.steel,
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sala['nombre']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brightLights,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white70,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        sala['ubicacion']!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sala['descripcion']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
