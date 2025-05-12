import 'package:flutter/material.dart';
import 'package:quitojam_1/styles/colors/colors.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.headerFooter,
      padding: const EdgeInsets.all(12.0),
      child: const Center(
        child: Text(
          '© 2025 Quito Jam',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
