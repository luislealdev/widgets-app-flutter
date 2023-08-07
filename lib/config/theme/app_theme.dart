import 'package:flutter/material.dart';

const colors = <Color>[
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.green,
  Colors.purple
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({required this.selectedColor, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'Selected color must be 0 or grater'),
        assert(selectedColor < colors.length,
            'Selected color must be lower than ${colors.length}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colors[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
