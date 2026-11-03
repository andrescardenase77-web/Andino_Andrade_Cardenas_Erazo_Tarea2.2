import 'package:flutter/material.dart';
import 'tema.dart';
import 'views/pantallas/pantalla_splash.dart';
import 'package:provider/provider.dart';
import 'viewmodels/galeria_viewmodel.dart';
import 'views/pantallas/pantalla_galeria.dart';
// Importaciones de las pantallas de los companeros (descomentar al integrarlas):
// import 'views/pantallas/pantalla_productos.dart';
// import 'views/pantallas/pantalla_detalle.dart';

void main() {
  runApp(
  ChangeNotifierProvider(
    create: (_) => GaleriaViewModel(),
    child: const MiAplicacion(),
  ),
  );

}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Productos',
      debugShowCheckedModeBanner: false,
      // Aplicacion del tema global reutilizable
      theme: temaAplicacion,
      // Ruta inicial de la aplicacion
      initialRoute: '/galeria',
      // Definicion de rutas nombradas
      routes: {
        '/': (context) => const PantallaSplash(),
        '/galeria': (context) => const PantallaGaleria(),
        // Rutas que seran implementadas por los demas integrantes del equipo:
        // '/productos': (context) => const PantallaProductos(),
        // '/detalle': (context) => const PantallaDetalle(),
      },
    );
  }
}


