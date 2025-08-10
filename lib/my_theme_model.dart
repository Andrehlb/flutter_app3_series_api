import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeModel extends ChangeNotifier {

  bool isDark = true;
  MyTheme myTheme = MyTheme(color: Color(0xff8716d5));
  ThemeData get customTheme => myTheme.customTheme;
  ThemeData get customThemeDark => myTheme.customThemeDark;
  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  void toogleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class MyTheme {
  // Default color value
  Color color;

  // Uso de late para inicializar as propriedades posteriormente
  late ColorScheme colorScheme;
  late ColorScheme colorSchemeDark;
  late ThemeData customTheme;
  late ThemeData customThemeDark;

  MyTheme({required this.color}) {
    colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );

    colorSchemeDark = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );