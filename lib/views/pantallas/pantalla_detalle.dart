import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/foto.dart';
import '../../tema.dart';
import '../../viewmodels/galeria_viewmodel.dart';
import '../widgets/fondo_degradado.dart';

class PantallaDetalle extends StatefulWidget {
  const PantallaDetalle({super.key});

  @override
  State<PantallaDetalle> createState() => _PantallaDetalleState();
}

class _PantallaDetalleState extends State<PantallaDetalle> {
  double _escalaBase = 1.0;

  @override
  Widget build(BuildContext context) {
    // Escucha activa del ViewModel con Provider (watch)
    final vm = context.watch<GaleriaViewModel>();

    // Recibir la fotografia seleccionada mediante arguments (Ruta nombrada)
    final args = ModalRoute.of(context)?.settings.arguments;
    final Foto foto = args is Foto
        ? args
        : (vm.fotoSeleccionada ??
            (vm.fotos.isNotEmpty
                ? vm.fotos.first
                : const Foto(id: 0, titulo: 'Detalle', url: '')));

    final bool esFav = vm.esFavorita(foto.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(foto.titulo),
        actions: [
          IconButton(
            tooltip: esFav ? 'Quitar de favoritos' : 'Agregar a favoritos',
            icon: Icon(
              esFav ? Icons.favorite : Icons.favorite_border,
              color: esFav ? Colors.red : Colors.white,
            ),
            onPressed: () {
              // context.read para alternar favorito sin reconstruir antes del evento
              context.read<GaleriaViewModel>().alternarFavorito(foto);
            },
          ),
        ],
      ),
      body: FondoDegradado(
        hijo: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Center(
                      // Gesto 2: multitáctil para ampliar o reducir la imagen
                      child: GestureDetector(
                        onScaleStart: (details) {
                          _escalaBase = vm.escala;
                        },
                        onScaleUpdate: (details) {
                          context
                              .read<GaleriaViewModel>()
                              .actualizarEscala(_escalaBase * details.scale);
                        },
                        child: ClipRect(
                          child: Transform.scale(
                            scale: vm.escala,
                            child: Image.network(
                              foto.url,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: double.infinity,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Panel informativo con el estado de la imagen y controles
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Zoom: ${(vm.escala * 100).toInt()}%',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: colorAzulOscuro,
                              ),
                            ),
                            Text(
                              esFav ? 'Favorita' : 'No favorita',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: esFav ? Colors.red : colorAzulMedio,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context
                                  .read<GaleriaViewModel>()
                                  .actualizarEscala(1.0);
                            },
                            icon: const Icon(Icons.restart_alt),
                            label: const Text('Restablecer zoom'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
