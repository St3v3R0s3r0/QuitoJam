import 'package:flutter/material.dart';
import 'package:quitojam_1/widgets/base_screen.dart';
import 'package:quitojam_1/widgets/custom_drawer.dart';

class MisReservasScreen extends StatelessWidget {
  const MisReservasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      drawer: const CustomDrawer(tipoUsuario: 'cliente'),
      body: const Center(
        child: Text(
          'Mis reservas como cliente',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
