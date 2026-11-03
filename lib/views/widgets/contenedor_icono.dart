import 'package:flutter/material.dart';
import '../../tema.dart';

// Widget base reutilizable para mostrar iconos o logos dentro de un contenedor circular con sombra
class ContenedorIcono extends StatelessWidget {
  final IconData icono;
  final double tamanoIcono;
  final double tamanoContenedor;
  final Color colorIcono;
  final Color colorFondo;

  const ContenedorIcono({
    super.key,
    required this.icono,
    this.tamanoIcono = 70.0,
    this.tamanoContenedor = 130.0,
    this.colorIcono = colorAzulPrimario,
    this.colorFondo = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tamanoContenedor,
      height: tamanoContenedor,
      decoration: BoxDecoration(
        color: colorFondo,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: colorAzulPrimario.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Icon(
        icono,
        size: tamanoIcono,
        color: colorIcono,
      ),
    );
  }
}
