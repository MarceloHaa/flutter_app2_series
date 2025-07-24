import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeModel extends ChangeNotifier {
  bool isDark = false;
  MyTheme myTheme = MyTheme(color: Color.fromARGB(255, 15, 92, 19));
  ThemeData get customTheme => myTheme.customTheme;
  ThemeData get customThemeDark => myTheme.customThemeDark;

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class MyTheme {
  Color color;

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

    customTheme = ThemeData(
      colorScheme: colorScheme,
      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorScheme.primary,
        titleTextStyle: GoogleFonts.shadowsIntoLight(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.secondaryContainer,
        shadowColor: colorScheme.onSurface,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    customThemeDark = ThemeData(
      colorScheme: colorSchemeDark,
      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorSchemeDark.onPrimary,
        titleTextStyle: GoogleFonts.shadowsIntoLight(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorSchemeDark.primary,
        ),
        iconTheme: IconThemeData(color: colorSchemeDark.primary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorSchemeDark.secondaryContainer,
        shadowColor: colorSchemeDark.onSurface,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
