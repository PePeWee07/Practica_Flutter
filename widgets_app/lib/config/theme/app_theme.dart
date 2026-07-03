import 'package:flutter/material.dart';

const List<Color> colorList = [
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
        selectColor >= 0 && selectColor <= colorList.length - 1,
        'Los colores deben ser entre 0 y ${colorList.length}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectColor],
      // brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }
}
