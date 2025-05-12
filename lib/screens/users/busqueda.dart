import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../services/mock_salas.dart';
import '../../models/sala_model.dart';
import 'detalle_sala.dart';

class BusquedaScreen extends StatefulWidget {
  const BusquedaScreen({super.key});

  @override
  State<BusquedaScreen> createState() => _BusquedaScreenState();
}

class _BusquedaScreenState extends State<BusquedaScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Sala> salas = [];
  List<Sala> resultados = [];

  @override
  void initState() {
    super.initState();
    salas = obtenerSalasMock();
    resultados = salas;
  }

  void _filtrarResultados(String query) {
    final filtrados =
        salas.where((sala) {
          final nombre = sala.nombre.toLowerCase();
          final descripcion = sala.descripcion.toLowerCase();
          final input = query.toLowerCase();
          return nombre.contains(input) || descripcion.contains(input);
        }).toList();

    setState(() => resultados = filtrados);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Buscar Salas'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              onChanged: _filtrarResultados,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o descripción...',
                hintStyle: const TextStyle(color: Colors.white60),
                filled: true,
                fillColor: Colors.grey[850],
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: FlutterMap(
              options: MapOptions(center: LatLng(-0.1807, -78.4678), zoom: 13),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.quitojam',
                ),
                MarkerLayer(
                  markers:
                      resultados.asMap().entries.map((entry) {
                        final index = entry.key;
                        final sala = entry.value;
                        final offset = 0.01 * index;

                        return Marker(
                          point: LatLng(-0.1807 + offset, -78.4678 + offset),
                          width: 40,
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetalleSalaScreen(sala: sala),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.location_on,
                              size: 36,
                              color: Colors.red,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: resultados.length,
              itemBuilder: (_, index) {
                final sala = resultados[index];
                return ListTile(
                  title: Text(
                    sala.nombre,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    sala.descripcion,
                    style: const TextStyle(color: Colors.white60),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetalleSalaScreen(sala: sala),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
