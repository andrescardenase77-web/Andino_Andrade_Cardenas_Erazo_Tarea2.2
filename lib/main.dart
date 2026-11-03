import 'package:flutter/material.dart';
import 'tema.dart';
import 'views/pantallas/pantalla_splash.dart';
// Importaciones de las pantallas de los companeros (descomentar al integrarlas):
// import 'views/pantallas/pantalla_galeria.dart';
// import 'views/pantallas/pantalla_detalle.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galería de Fotografías',
      debugShowCheckedModeBanner: false,
      // Aplicacion del tema global reutilizable
      theme: temaAplicacion,
      // Ruta inicial de la aplicacion
      initialRoute: '/',
      // Definicion de rutas nombradas
      routes: {
        '/': (context) => const PantallaSplash(),
        // Rutas que seran implementadas por los demas integrantes del equipo:
        // '/galeria': (context) => const PantallaGaleria(),
        // '/detalle': (context) => const PantallaDetalle(),
      },
    );
  }
}
