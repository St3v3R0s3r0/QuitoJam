import 'package:flutter/material.dart';
import 'package:quitojam_1/widgets/base_screen.dart';
import 'package:quitojam_1/widgets/custom_drawer.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      drawer: const CustomDrawer(tipoUsuario: 'cliente'),
      body: const Center(
        child: Text(
          'Pantalla de perfil de usuario',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
