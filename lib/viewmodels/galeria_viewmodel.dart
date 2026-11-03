import 'package:flutter/material.dart';
import '../models/foto.dart';

// ViewModel: administra fotografias, favoritas, imagen seleccionada y estado (escala)
class GaleriaViewModel extends ChangeNotifier {
  final List<Foto> _fotos = const [
    Foto(id: 1, titulo: 'Montaña', url: 'https://t4.ftcdn.net/jpg/08/76/45/55/360_F_876455514_i6EqhtZ7XrEFkVmtnzkXlMDvIH8MqYqa.jpg'),
    Foto(id: 2, titulo: 'Bosque', url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_ZV8stnn2i2g24R1isWCV6IH4mumnXe7wCHBVrAaPqQ&s=10'),
    Foto(id: 3, titulo: 'Lago', url: 'https://media.istockphoto.com/id/2130934199/es/foto/incre%C3%ADble-paisaje-en-un-lago-de-monta%C3%B1a-en-los-alpes-b%C3%A1varos.jpg?s=612x612&w=0&k=20&c=bHw-V6UHjTvD5migbSs3gqW9caml9FJcd0V3r6RNC2c='),
    Foto(id: 4, titulo: 'Playa', url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxhv5jRDarmbnBLQ-3crXF4Y6wTiJfHsmzo8CnwaH2vAB9B_uXMZ58m8Bn&s=10'),
    Foto(id: 5, titulo: 'Camino', url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_1AMrPlx5yRFjiYLAQXzwQ6OYbIuKQopwOPcIppDsE6HcdDqIup_-scE&s=10'),
    Foto(id: 6, titulo: 'Costa', url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuL_IwBaaD9L_386yIFmkiHpoljTRBtubLsUAUguQYtA&s=10'),
  ];

  final Set<int> _idsFavoritos = {};
  Foto? _fotoSeleccionada;
  double _escala = 1.0;

  List<Foto> get fotos => _fotos;
  Foto? get fotoSeleccionada => _fotoSeleccionada;
  double get escala => _escala;

  bool esFavorita(int id) => _idsFavoritos.contains(id);

  void alternarFavorito(Foto foto) {
    if (!_idsFavoritos.remove(foto.id)) {
      _idsFavoritos.add(foto.id);
    }
    notifyListeners();
  }

  void seleccionarFoto(Foto foto) {
    _fotoSeleccionada = foto;
    _escala = 1.0;
    notifyListeners();
  }

  void actualizarEscala(double valor) {
    _escala = valor.clamp(1.0, 4.0);
    notifyListeners();
  }
}