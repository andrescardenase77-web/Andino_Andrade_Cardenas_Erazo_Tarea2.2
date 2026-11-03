import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tarea_4/main.dart';

void main() {
  testWidgets('Prueba basica de carga de la pantalla splash', (WidgetTester probador) async {
    // Construir la aplicacion y disparar un frame
    await probador.pumpWidget(const MiAplicacion());

    // Verificar que el titulo y los iconos de la galeria estan presentes
    expect(find.text('Galería de Fotografías'), findsOneWidget);
    expect(find.byIcon(Icons.photo_library_rounded), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_rounded), findsOneWidget);
  });
}
