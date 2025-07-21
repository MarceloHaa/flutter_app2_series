import 'package:flutter/material.dart';
import 'package:flutter_app2_series/tv_show_form.dart';
import 'package:flutter_app2_series/custom_drawer.dart';
import 'package:flutter_app2_series/tv_show_data.dart';
import 'package:flutter_app2_series/tv_show_model.dart';
import 'package:flutter_app2_series/tv_show_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TvShowModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<TvShow> tvShows = favTvShowList;

  void addTvShow(TvShow tvShow) {
    setState(() {
      tvShows.add(tvShow);
    });
  }

  void removeTvShow(TvShow tvShow) {
    //final index = tvShows.indexWhere(
    // (show) => show.title.toLowerCase() == tvShow.title.toLowerCase()
    // );
    setState(() {
      tvShows.remove(tvShow);
    });
  }

  int currentScreenIndex = 0;

  List<Widget> get screens => [
    TvShowScreen(),
    AddTvShowScreen(switchScreen: switchScreen),
  ];

  void switchScreen(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  bool isDark = false;
  void switchTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    var color = Color.fromARGB(255, 28, 138, 63);

    var colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );

    var colorSchemeDark = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );

    var customTheme = ThemeData(
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

    var customThemeDark = ThemeData(
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
        iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorSchemeDark.secondaryContainer,
        shadowColor: colorSchemeDark.onSurface,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      darkTheme: customThemeDark,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [const Text('Eu Amo Séries 🎬')],
          ),
        ),
        drawer: CustomDrawer(
          isDark: isDark,
          switchTheme: switchTheme,
          switchScreen: switchScreen,
        ),
        body: screens[currentScreenIndex],
      ),
    );
  }
}
