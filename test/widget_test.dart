import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tarea_4/main.dart';

void main() {
  testWidgets('Prueba basica de carga de la pantalla splash', (WidgetTester probador) async {
    // Construir la aplicacion y disparar un frame
    await probador.pumpWidget(const MiAplicacion());

    // Verificar que el titulo y los iconos de la tienda estan presentes
    expect(find.text('Catálogo de Productos'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_rounded), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_rounded), findsOneWidget);
  });
}
