import 'package:flutter/material.dart';
import 'package:quitojam_1/styles/colors/colors.dart';
import 'package:quitojam_1/services/mock_user_session.dart';
import 'package:quitojam_1/widgets/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? drawer;
  final Widget? bottomNavigationBar;

  const BaseScreen({
    super.key,
    this.appBar,
    required this.body,
    this.drawer,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoGeneral,
      appBar: appBar ??
          AppBar(
            backgroundColor: AppColors.headerFooter,
            iconTheme: const IconThemeData(color: AppColors.brightLights),
            title: Image.asset('assets/logo.png', height: 40),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: AppColors.brightLights),
                onPressed: () {
                  Navigator.pushNamed(context, '/busqueda');
                },
              ),
            ],
          ),
      drawer: drawer ?? CustomDrawer(tipoUsuario: _getTipoUsuarioActual()),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  String _getTipoUsuarioActual() {
    switch (MockUserSession.tipoUsuarioActual) {
      case TipoUsuario.admin:
        return 'admin';
      case TipoUsuario.cliente:
        return 'cliente';
      case TipoUsuario.invitado:
      default:
        return 'invitado';
    }
  }
}
