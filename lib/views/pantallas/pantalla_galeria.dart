import 'package:flutter/material.dart';
import '../../tema.dart';
import '../../viewmodels/galeria_viewmodel.dart';
import '../widgets/fondo_degradado.dart';
import 'package:provider/provider.dart';

class PantallaGaleria extends StatelessWidget {
  const PantallaGaleria({super.key});

  @override
  Widget build(BuildContext context) {
    // watch: redibuja la pantalla cuando cambian los favoritos
    final vm = context.watch<GaleriaViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Galería')),
      body: FondoDegradado(
        hijo: GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: vm.fotos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, indice) {
            final foto = vm.fotos[indice];
            final esFav = vm.esFavorita(foto.id);

            return GestureDetector(
              // Gesto 1: doble toque para agregar o quitar de favoritos
              onDoubleTap: () =>
                  context.read<GaleriaViewModel>().alternarFavorito(foto),
              // Toque simple: abre el detalle enviando la foto en arguments
              onTap: () {
                context.read<GaleriaViewModel>().seleccionarFoto(foto);
                Navigator.pushNamed(context, '/detalle', arguments: foto);
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(foto.url, fit: BoxFit.cover),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          esFav ? Icons.favorite : Icons.favorite_border,
                          color: esFav ? Colors.red : colorAzulPrimario,
                          size: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: colorAzulOscuro.withValues(alpha: 0.75),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          foto.titulo,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
