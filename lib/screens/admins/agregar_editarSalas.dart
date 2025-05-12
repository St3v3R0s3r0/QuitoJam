import 'package:flutter/material.dart';
import 'package:quitojam_1/widgets/base_screen.dart';
import 'package:quitojam_1/widgets/custom_drawer.dart';

class AgregarEditarSalasScreen extends StatelessWidget {
  const AgregarEditarSalasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      drawer: const CustomDrawer(tipoUsuario: 'admin'),
      body: const Center(
        child: Text(
          'Formulario para agregar o editar salas',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
