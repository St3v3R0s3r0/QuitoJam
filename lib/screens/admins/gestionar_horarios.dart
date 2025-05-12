import 'package:flutter/material.dart';
import 'package:quitojam_1/widgets/base_screen.dart';
import 'package:quitojam_1/widgets/custom_drawer.dart';

class GestionarHorariosScreen extends StatelessWidget {
  const GestionarHorariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      drawer: const CustomDrawer(tipoUsuario: 'admin'),
      body: const Center(
        child: Text(
          'Pantalla para gestionar horarios de salas',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
