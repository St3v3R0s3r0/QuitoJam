import 'package:flutter/material.dart';
import '../../models/sala_model.dart';

class ReservaScreen extends StatefulWidget {
  final Sala sala;

  const ReservaScreen({super.key, required this.sala});

  @override
  State<ReservaScreen> createState() => _ReservaScreenState();
}

class _ReservaScreenState extends State<ReservaScreen> {
  DateTime? _fechaSeleccionada;
  String? _horaSeleccionada;
  final List<String> _horariosDisponibles = [
    '10:00 AM',
    '12:00 PM',
    '2:00 PM',
    '4:00 PM',
    '6:00 PM',
    '8:00 PM',
  ];

  void _mostrarSelectorFecha() async {
    final now = DateTime.now();
    final seleccion = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
    );

    if (seleccion != null) {
      setState(() {
        _fechaSeleccionada = seleccion;
      });
    }
  }

  void _confirmarReserva() {
    if (_fechaSeleccionada != null && _horaSeleccionada != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Reserva confirmada para ${widget.sala.nombre} el ${_fechaSeleccionada!.toLocal().toString().split(' ')[0]} a las $_horaSeleccionada',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor selecciona una fecha y hora.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const yellow = Color(0xFFFFC400);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Reservar Sala'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sala.nombre,
              style: const TextStyle(
                color: yellow,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _mostrarSelectorFecha,
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _fechaSeleccionada == null
                    ? 'Seleccionar fecha'
                    : 'Fecha: ${_fechaSeleccionada!.toLocal().toString().split(' ')[0]}',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: yellow,
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.grey[900],
              decoration: const InputDecoration(
                labelText: 'Hora',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: yellow),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              items:
                  _horariosDisponibles.map((hora) {
                    return DropdownMenuItem(value: hora, child: Text(hora));
                  }).toList(),
              onChanged: (value) => setState(() => _horaSeleccionada = value),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _confirmarReserva,
                child: const Text('Confirmar Reserva'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: yellow,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
