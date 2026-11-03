import 'package:flutter/material.dart';

// Constantes de colores para la paleta azul reutilizable
const Color colorAzulOscuro = Color(0xFF0D47A1);
const Color colorAzulPrimario = Color(0xFF1565C0);
const Color colorAzulMedio = Color(0xFF1976D2);
const Color colorAzulClaro = Color(0xFF90CAF9);
const Color colorAzulFondo = Color(0xFFE3F2FD);

// Degradado azul reutilizable para fondos de pantalla
const LinearGradient degradadoFondoAzul = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFE3F2FD), // Azul muy claro
    Color(0xFFBBDEFB), // Azul suave
    Color(0xFF90CAF9), // Azul claro
  ],
);

// Configuracion global del tema visual para toda la aplicacion
final ThemeData temaAplicacion = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: colorAzulPrimario,
    primary: colorAzulPrimario,
    secondary: colorAzulMedio,
    surface: colorAzulFondo,
    onPrimary: Colors.white,
    onSurface: colorAzulOscuro,
  ),
  scaffoldBackgroundColor: colorAzulFondo,

  // Configuracion de la barra superior para las pantallas
  appBarTheme: const AppBarTheme(
    backgroundColor: colorAzulPrimario,
    foregroundColor: Colors.white,
    elevation: 2,
    centerTitle: true,
  ),

  // Configuracion de tarjetas para el catalogo de productos
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  // Configuracion de botones elevados
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorAzulOscuro,
      foregroundColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
