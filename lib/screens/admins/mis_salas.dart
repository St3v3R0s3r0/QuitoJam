import 'package:flutter/material.dart';
import 'package:quitojam_1/models/sala_admin_model.dart';
import 'package:quitojam_1/services/mock_salas_admin.dart';
import 'package:quitojam_1/styles/colors/colors.dart';
import 'package:quitojam_1/widgets/base_screen.dart';
import 'package:quitojam_1/widgets/custom_drawer.dart';

class MisSalasScreen extends StatelessWidget {
  const MisSalasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final salas = obtenerSalasDelAdminMock(); // servicio mock

    return BaseScreen(
      drawer: const CustomDrawer(tipoUsuario: 'admin'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: salas.length,
        itemBuilder: (context, index) {
          final sala = salas[index];
          return Card(
            color: AppColors.steel,
            margin: const EdgeInsets.only(bottom: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sala.nombre,
                      style: const TextStyle(
                        color: AppColors.brightLights,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 4),
                  Text('Ubicación: ${sala.ubicacion}',
                      style: const TextStyle(color: AppColors.classic)),
                  Text('Capacidad: ${sala.capacidad}',
                      style: const TextStyle(color: AppColors.classic)),
                  Text(
                      'Precio por hora: \$${sala.precioPorHora.toStringAsFixed(2)}',
                      style: const TextStyle(color: AppColors.classic)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/editar-sala');
                        },
                        child: const Text('Editar',
                            style: TextStyle(color: AppColors.brightLights)),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: lógica de eliminación
                        },
                        child: const Text('Eliminar',
                            style: TextStyle(color: Colors.redAccent)),
                      ),
                    ],
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
