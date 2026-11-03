import 'package:flutter/material.dart';
import '../../tema.dart';
import '../widgets/fondo_degradado.dart';
import '../widgets/contenedor_icono.dart';
import '../widgets/boton_flecha.dart';

class PantallaSplash extends StatefulWidget {
  const PantallaSplash({super.key});

  @override
  State<PantallaSplash> createState() => _EstadoPantallaSplash();
}

class _EstadoPantallaSplash extends State<PantallaSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController controladorAnimacion;
  late Animation<double> animacionOpacidad;
  late Animation<double> animacionEscala;

  @override
  void initState() {
    super.initState();

    // Configuracion de la animacion de 5 segundos
    controladorAnimacion = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // Animacion para la aparicion progresiva suave
    animacionOpacidad = CurvedAnimation(
      parent: controladorAnimacion,
      curve: Curves.easeInOut,
    );

    // Animacion de cambio de tamano progresivo
    animacionEscala = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: controladorAnimacion,
        curve: Curves.easeOutCubic,
      ),
    );

    // Iniciar la animacion
    controladorAnimacion.forward();
  }

  @override
  void dispose() {
    controladorAnimacion.dispose();
    super.dispose();
  }

  // Metodo para avanzar a la siguiente pantalla
  void avanzarSiguientePantalla() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Navegando a la pantalla de productos...'),
        duration: Duration(seconds: 2),
      ),
    );

    try {
      Navigator.pushReplacementNamed(context, '/productos');
    } catch (_) {
      // Manejo seguro en caso de que la ruta aun no este activa en main.dart
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Uso del widget base FondoDegradado
      body: FondoDegradado(
        hijo: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  // Animacion combinada de escala y opacidad durante 5 segundos
                  ScaleTransition(
                    scale: animacionEscala,
                    child: FadeTransition(
                      opacity: animacionOpacidad,
                      child: Column(
                        children: [
                          // Uso del widget base ContenedorIcono
                          const ContenedorIcono(
                            icono: Icons.shopping_bag_rounded,
                            tamanoIcono: 70,
                            tamanoContenedor: 130,
                            colorIcono: colorAzulPrimario,
                          ),
                          const SizedBox(height: 28),

                          // Nombre de la tienda
                          const Text(
                            'Catálogo de Productos',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: colorAzulOscuro,
                              letterSpacing: 0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),

                          // Subtitulo de la tienda
                          const Text(
                            'Tu tienda virtual favorita',
                            style: TextStyle(
                              fontSize: 16,
                              color: colorAzulMedio,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Boton con flecha utilizando el widget base BotonFlecha
                  FadeTransition(
                    opacity: animacionOpacidad,
                    child: Column(
                      children: [
                        BotonFlecha(
                          alPresionar: avanzarSiguientePantalla,
                          icono: Icons.arrow_forward_rounded,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Continuar',
                          style: TextStyle(
                            color: colorAzulOscuro,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
