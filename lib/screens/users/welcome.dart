import 'dart:async';
import 'package:flutter/material.dart';
import 'show_rooms.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ShowRoomsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 250),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 234, 255, 0),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
