import 'package:flutter/material.dart';
import 'package:quitojam_1/widgets/base_screen.dart';
import 'package:quitojam_1/widgets/custom_drawer.dart';

class InicioAdminScreen extends StatelessWidget {
  const InicioAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      drawer: const CustomDrawer(tipoUsuario: 'admin'),
      body: const Center(
        child: Text(
          'Inicio del panel administrativo',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
