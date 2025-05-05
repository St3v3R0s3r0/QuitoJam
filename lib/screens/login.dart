import 'package:flutter/material.dart';
import 'package:quitojam_1/styles/colors/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.skyline,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Aquí va el logo arriba
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            width: 400,
                            height: 400,
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),

                    _buildInputField('Usuario', Icons.person),
                    const SizedBox(height: 16),
                    _buildInputField('Contraseña', Icons.lock, obscure: true),
                    const SizedBox(height: 24),
                    _buildButton('Iniciar sesión'),
                    const SizedBox(height: 16),
                    _buildOutlinedButton('Crear cuenta'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hint, IconData icon, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: AppColors.brightLights),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.brightLights),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.brightLights),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.cement),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.brightLights),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brightLights,
        foregroundColor: AppColors.skyline,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        // TODO: lógica de login
      },
      child: Text(text),
    );
  }

  Widget _buildOutlinedButton(String text) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.brightLights,
        side: const BorderSide(color: AppColors.brightLights),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        // TODO: redirigir a registro
      },
      child: Text(text),
    );
  }
}
