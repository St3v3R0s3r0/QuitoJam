import 'package:flutter/material.dart';
import 'package:quitojam_1/styles/colors/colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

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
                    const SizedBox(height: 30),

                    _buildInput('Nombre', Icons.person),
                    _buildInput('Cédula', Icons.credit_card),
                    _buildInput('Correo', Icons.email),
                    _buildInput('Contraseña', Icons.lock, obscure: true),
                    _buildInput('Teléfono', Icons.phone),

                    const SizedBox(height: 16),
                    _buildPhotoUploadButton(),
                    const SizedBox(height: 24),
                    _buildRegisterButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String label, IconData icon, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: obscure,
        style: const TextStyle(color: AppColors.brightLights),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.brightLights),
          hintText: label,
          hintStyle: const TextStyle(color: AppColors.brightLights),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.brightLights),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.brightLights),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoUploadButton() {
    return OutlinedButton.icon(
      onPressed: () {
        // TODO: lógica de imagen
      },
      icon: const Icon(Icons.camera_alt, color: AppColors.brightLights),
      label: const Text(
        'Subir foto (opcional)',
        style: TextStyle(color: AppColors.brightLights),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.brightLights),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        // TODO: lógica de registro
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brightLights,
        foregroundColor: AppColors.skyline,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: const Text('Crear cuenta'),
    );
  }
}
