import 'package:flutter/material.dart';
import 'package:quitojam_1/styles/colors/colors.dart';

class CustomDrawer extends StatelessWidget {
  final String tipoUsuario; // 'admin', 'cliente', 'invitado'

  const CustomDrawer({super.key, required this.tipoUsuario});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.steel,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            color: AppColors.fondoGeneral,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.classic,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  _getNombreTipo(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brightLights,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: _getDrawerItems(context),
            ),
          ),
          const Divider(color: AppColors.cement),
          ListTile(
            leading: Icon(
              tipoUsuario == 'invitado' ? Icons.login : Icons.logout,
              color: AppColors.brightLights,
            ),
            title: Text(
              tipoUsuario == 'invitado' ? 'Iniciar Sesión' : 'Cerrar Sesión',
              style: const TextStyle(color: AppColors.brightLights),
            ),
            onTap: () {
              if (tipoUsuario == 'invitado') {
                Navigator.pushNamed(context, '/login');
              } else {
                // Aquí puedes colocar lógica de cierre de sesión (y redirigir)
                Navigator.pushReplacementNamed(context, '/');
              }
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  List<Widget> _getDrawerItems(BuildContext context) {
    switch (tipoUsuario) {
      case 'admin':
        return [
          _drawerItem(Icons.home, 'Inicio', () {
            Navigator.pushReplacementNamed(context, '/inicio-admin');
          }),
          _drawerItem(Icons.meeting_room, 'Mis Salas', () {
            Navigator.pushNamed(context, '/mis-salas');
          }),
          _drawerItem(Icons.schedule, 'Gestionar Horarios', () {
            Navigator.pushNamed(context, '/gestionar-horarios');
          }),
          _drawerItem(Icons.attach_money, 'Precios y Equipos', () {
            Navigator.pushNamed(context, '/editar-sala');
          }),
          _drawerItem(Icons.calendar_today, 'Reservas Recibidas', () {
            Navigator.pushNamed(context, '/reservas-recibidas');
          }),
        ];
      case 'cliente':
        return [
          _drawerItem(Icons.home, 'Inicio', () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          _drawerItem(Icons.calendar_today, 'Mis Reservas', () {
            Navigator.pushNamed(context, '/mis-reservas');
          }),
          _drawerItem(Icons.history, 'Historial', () {
            // Futuro: /historial
          }),
          _drawerItem(Icons.person, 'Perfil', () {
            Navigator.pushNamed(context, '/perfil');
          }),
        ];
      case 'invitado':
      default:
        return [
          _drawerItem(Icons.home, 'Inicio', () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          _drawerItem(Icons.person_add, 'Registrarse / Iniciar Sesión', () {
            Navigator.pushNamed(context, '/login');
          }),
        ];
    }
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.classic),
      title: Text(title, style: const TextStyle(color: AppColors.classic)),
      hoverColor: AppColors.cement.withOpacity(0.2),
      onTap: onTap,
    );
  }

  String _getNombreTipo() {
    switch (tipoUsuario) {
      case 'admin':
        return 'Administrador';
      case 'cliente':
        return 'Usuario';
      case 'invitado':
      default:
        return 'Invitado';
    }
  }
}
