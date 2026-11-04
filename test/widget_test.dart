import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarea_4/main.dart';
import 'package:tarea_4/models/foto.dart';
import 'package:tarea_4/viewmodels/galeria_viewmodel.dart';
import 'package:tarea_4/views/pantallas/pantalla_detalle.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Prueba basica de carga de la pantalla splash', (WidgetTester probador) async {
    await probador.pumpWidget(const MiAplicacion());

    expect(find.text('Galería de Fotografías'), findsOneWidget);
    expect(find.byIcon(Icons.photo_library_rounded), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_rounded), findsOneWidget);
  });

  testWidgets('Prueba de navegacion y funcionalidad de la pantalla de detalle con Provider', (WidgetTester probador) async {
    final vm = GaleriaViewModel();
    const fotoPrueba = Foto(
      id: 99,
      titulo: 'Foto de Prueba',
      url: 'https://example.com/test.jpg',
    );
    vm.seleccionarFoto(fotoPrueba);

    await probador.pumpWidget(
      ChangeNotifierProvider.value(
        value: vm,
        child: const MaterialApp(
          home: PantallaDetalle(),
        ),
      ),
    );

    // Verificar que se muestra el titulo de la foto y el zoom inicial al 100%
    expect(find.text('Foto de Prueba'), findsOneWidget);
    expect(find.text('Zoom: 100%'), findsOneWidget);
    expect(find.text('No favorita'), findsOneWidget);

    // Alternar favorito desde la pantalla de detalle
    await probador.tap(find.byIcon(Icons.favorite_border));
    await probador.pump();

    expect(vm.esFavorita(fotoPrueba.id), isTrue);
    expect(find.text('Favorita'), findsOneWidget);

    // Probar actualizacion de escala (estado de la imagen administrado por Provider)
    vm.actualizarEscala(2.5);
    await probador.pump();

    expect(find.text('Zoom: 250%'), findsOneWidget);

    // Presionar el boton de restablecer zoom
    await probador.tap(find.text('Restablecer zoom'));
    await probador.pump();

    expect(vm.escala, equals(1.0));
    expect(find.text('Zoom: 100%'), findsOneWidget);
  });
}
