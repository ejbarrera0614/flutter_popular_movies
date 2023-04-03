import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeManager {
  static const backgroundColor = Color(0xFF012a4a); // 0xFF012a4a;
  static const linearGradienteBg = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: [Colors.blue, Color.fromARGB(255, 86, 24, 122)]);
  static final borderCircularCard = BorderRadius.circular(20);
  static const gridViewDelegateHomeScreen =
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 25,
          mainAxisExtent: 270);
  static const paddingContentDetailsScreen =
      EdgeInsets.only(left: 40, right: 40, top: kToolbarHeight, bottom: 10);
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
      centerTitle: true,
    ),
  );
}
