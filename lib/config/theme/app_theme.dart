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

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0, 'Selected color must be 0 or grater'),
        assert(selectedColor < colors.length - 1,
            'Selected color must be lower than ${colors.length}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colors[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
