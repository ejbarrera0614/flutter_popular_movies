import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeManager {
  static const backgroundColor = Color(0xFF012a4a); // 0xFF012a4a;
  static const generalContentColor = Color(0xFF013a63);
  static const linearGradienteBg = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: [Colors.blue, Color.fromARGB(255, 86, 24, 122)]);
  static final borderCircularCard = BorderRadius.circular(20);

  static const List<Color> colorsBoxCardDecoration = [
    Color.fromARGB(255, 81, 162, 219),
    Color(0xFF013a63),
    Color(0xFF013a63),
  ];

  // List<Color> get colorsBoxDecoration => _colorsBoxDecoration;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: generalContentColor),
    textTheme: const TextTheme(),
  );
}
