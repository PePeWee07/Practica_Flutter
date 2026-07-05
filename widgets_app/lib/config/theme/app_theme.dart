import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.transparent,
  Colors.black,
  Colors.white,
  Colors.grey,
  Colors.yellowAccent,
  Colors.purple,
  Colors.teal,
  Colors.lightGreenAccent,
  Colors.lightBlueAccent,
  Colors.indigo,
];

class AppTheme {
  final int selectColor;
  final bool isDarkmode;

  AppTheme({this.selectColor = 0, this.isDarkmode = false})
    : assert(
        selectColor >= 0 && selectColor <= colorList.length - 1,
        'Los colores deben ser entre 0 y ${colorList.length}',
      );

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectColor],
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }

  AppTheme copyWith({int? selectColor, bool? isDarkmode}) => AppTheme(
    selectColor: selectColor ?? this.selectColor,
    isDarkmode: isDarkmode ?? this.isDarkmode,
  );
}
