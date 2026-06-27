import 'package:flutter/material.dart';

const Color _customColor = Color(0x00ff2342);
const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.yellowAccent,
  Colors.purple,
  Colors.teal,
  Colors.lightGreenAccent,
  Colors.lightBlueAccent,
  Colors.indigo,
  Colors.cyan,
  Colors.transparent,
  Colors.white70,
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0})
    : assert(
        selectColor >= 0 && selectColor <= _colorThemes.length - 1,
        'Los colores deben ser entre 0 y ${_colorThemes.length}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectColor],
      brightness: Brightness.dark,
    );
  }
}
