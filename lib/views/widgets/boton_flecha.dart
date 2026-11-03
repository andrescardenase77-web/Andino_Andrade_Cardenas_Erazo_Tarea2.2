import 'package:flutter/material.dart';
import '../../tema.dart';

// Widget base reutilizable para botones circulares de accion
class BotonFlecha extends StatelessWidget {
  final VoidCallback alPresionar;
  final IconData icono;
  final double tamanoIcono;
  final Color colorBoton;
  final Color colorIcono;

  const BotonFlecha({
    super.key,
    required this.alPresionar,
    this.icono = Icons.arrow_forward_rounded,
    this.tamanoIcono = 30.0,
    this.colorBoton = colorAzulOscuro,
    this.colorIcono = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: colorBoton.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: alPresionar,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(18),
          backgroundColor: colorBoton,
          foregroundColor: colorIcono,
          elevation: 0,
        ),
        child: Icon(
          icono,
          size: tamanoIcono,
        ),
      ),
    );
  }
}
