import 'package:flutter/material.dart';
import 'package:quitojam_1/services/mock_user_session.dart';
import 'package:quitojam_1/widgets/base_screen.dart';
import 'package:quitojam_1/widgets/sala_card_polaroid.dart';
import 'package:quitojam_1/services/mock_salas.dart';
import 'package:quitojam_1/services/mock_user_session.dart';
import 'detalle_sala.dart';

class ShowRoomsScreen extends StatefulWidget {
  const ShowRoomsScreen({super.key});

  @override
  State<ShowRoomsScreen> createState() => _ShowRoomsScreenState();
}

class _ShowRoomsScreenState extends State<ShowRoomsScreen> {
  @override
  Widget build(BuildContext context) {
    final salas = obtenerSalasMock();

    return BaseScreen(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: salas.length,
              itemBuilder: (context, index) {
                return SalaCardPolaroid(
                  sala: salas[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetalleSalaScreen(sala: salas[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<TipoUsuario>(
              value: MockUserSession.tipoUsuarioActual,
              dropdownColor: Colors.black,
              iconEnabledColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              onChanged: (TipoUsuario? nuevoValor) {
                if (nuevoValor != null) {
                  setState(() {
                    MockUserSession.tipoUsuarioActual = nuevoValor;
                  });
                }
              },
              items: TipoUsuario.values.map((TipoUsuario tipo) {
                return DropdownMenuItem<TipoUsuario>(
                  value: tipo,
                  child: Text(tipo.name),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
