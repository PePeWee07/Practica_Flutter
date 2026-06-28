import 'package:flutter/material.dart';

/// ESTADO GLOBAL.
///
/// Esta clase NO es un widget. Es una caja que guarda datos (el contador)
/// y avisa cuando cambian. Vive "por encima" del árbol de widgets, así que
/// cualquier pantalla puede leerla o modificarla.
///
/// `ChangeNotifier` te da gratis el método `notifyListeners()`:
/// es el "¡oigan los que me observan, cambié, redibújense!".
class CounterProvider extends ChangeNotifier {
  // El estado vive acá adentro, privado (guion bajo = privado en Dart).
  int _counter = 0;

  // Getter: la UI lee el valor por acá, pero NO puede asignarlo directo.
  // Solo se cambia con los métodos de abajo (encapsulamiento).
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // sin esto, el valor cambia pero la UI NO se entera.
  }

  void decrement() {
    if (_counter == 0) return; // no bajamos de cero
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}
