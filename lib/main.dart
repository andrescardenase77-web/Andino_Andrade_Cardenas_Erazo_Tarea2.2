import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tema.dart';
import 'viewmodels/galeria_viewmodel.dart';
import 'views/pantallas/pantalla_splash.dart';
import 'views/pantallas/pantalla_galeria.dart';
import 'views/pantallas/pantalla_detalle.dart';

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
      title: 'Galería de Fotografías',
      debugShowCheckedModeBanner: false,
      // Aplicacion del tema global reutilizable
      theme: temaAplicacion,
      // Ruta inicial de la aplicacion (inicia en la pantalla Splash)
      initialRoute: '/',
      // Definicion de rutas nombradas
      routes: {
        '/': (context) => const PantallaSplash(),
        '/galeria': (context) => const PantallaGaleria(),
        '/detalle': (context) => const PantallaDetalle(),
      },
    );
  }
}
