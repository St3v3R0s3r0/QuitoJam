import 'package:flutter/material.dart';

//Navbar el cual se lo puede referenciar en cualquier apartadod de la aplicación.

class CustomDrawer extends StatelessWidget {
  final bool isAuthenticated;

  const CustomDrawer({super.key, required this.isAuthenticated});

  // Tus colores
  static const skyline = Color(0xFF000000);
  static const steel = Color(0xFF1C1C1C);
  static const cement = Color(0xFF3F3F3F);
  static const classic = Color(0xFFF4F4F4);
  static const brightLights = Color(0xFFFFC400);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: steel,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            color: skyline,
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: classic,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Text(
                  'Nombre del Usuario',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: brightLights,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _drawerItem(Icons.home, 'Inicio'),
                _drawerItem(Icons.search, 'Busquedas'),
                _drawerItem(Icons.calendar_today, 'Mis Reservas'),
                _drawerItem(Icons.meeting_room, 'Mis Salas'),
                _drawerItem(Icons.person, 'Perfil'),
                _drawerItem(Icons.info_outline, 'About'),
              ],
            ),
          ),
          const Divider(color: cement),
          ListTile(
            leading: Icon(
              isAuthenticated ? Icons.logout : Icons.login,
              color: brightLights,
            ),
            title: Text(
              isAuthenticated ? 'Sign Out' : 'Sign In',
              style: const TextStyle(color: brightLights),
            ),
            onTap: () {
              // TODO: lógica de sesión
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: classic),
      title: Text(title, style: const TextStyle(color: classic)),
      hoverColor: cement.withOpacity(0.2),
      onTap: () {
        // TODO: Navegación
      },
    );
  }
}
