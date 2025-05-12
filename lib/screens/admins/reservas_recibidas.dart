import 'package:flutter/material.dart';
import 'package:quitojam_1/models/reservas_admin.dart';
import 'package:quitojam_1/services/mock_reservas_admin.dart';
import 'package:quitojam_1/styles/colors/colors.dart';
import 'package:quitojam_1/widgets/base_screen.dart';
import 'package:quitojam_1/widgets/custom_drawer.dart';

class ReservasRecibidasScreen extends StatelessWidget {
  const ReservasRecibidasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservas = obtenerReservasAdminMock();

    return BaseScreen(
      drawer: const CustomDrawer(tipoUsuario: 'admin'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reservas.length,
        itemBuilder: (context, index) {
          final reserva = reservas[index];
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
                  Text(reserva.nombreSala,
                      style: const TextStyle(
                          color: AppColors.brightLights,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Reservado por: ${reserva.nombreUsuario}',
                      style: const TextStyle(color: AppColors.classic)),
                  Text('Inicio: ${reserva.fechaInicio}',
                      style: const TextStyle(color: AppColors.classic)),
                  Text('Fin: ${reserva.fechaFin}',
                      style: const TextStyle(color: AppColors.classic)),
                  if (reserva.comentarios != null &&
                      reserva.comentarios!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text('Comentario: ${reserva.comentarios}',
                          style: const TextStyle(color: AppColors.classic)),
                    ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (reserva.estado == 'pendiente') ...[
                        TextButton(
                          onPressed: () {
                            // TODO: aceptar lógica
                          },
                          child: const Text('Aceptar',
                              style: TextStyle(color: Colors.greenAccent)),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: rechazar lógica
                          },
                          child: const Text('Rechazar',
                              style: TextStyle(color: Colors.redAccent)),
                        ),
                      ] else
                        Text('Estado: ${reserva.estado}',
                            style: const TextStyle(color: AppColors.classic)),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
