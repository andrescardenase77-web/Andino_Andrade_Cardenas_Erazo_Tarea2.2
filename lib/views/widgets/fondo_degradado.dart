import 'package:flutter/material.dart';
import '../../tema.dart';

// Widget base reutilizable para envolver pantallas con el fondo degradado azul
class FondoDegradado extends StatelessWidget {
  final Widget hijo;

  const FondoDegradado({
    super.key,
    required this.hijo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: degradadoFondoAzul,
      ),
      child: hijo,
    );
  }
}
