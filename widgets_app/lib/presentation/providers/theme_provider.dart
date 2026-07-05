import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Lista de colores inmutables
final colorListProvider = Provider<List<Color>>((ref) => colorList);

//color selecionado
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Un provider perzonalisado (AppTheme)

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorTheme(int colorIndex) {
    state = state.copyWith(selectColor: colorIndex); 
  }
}
