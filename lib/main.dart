import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mc_project2/screens/home.dart';

// var kColorScheme = ColorScheme.fromSeed(
//   seedColor: const Color.fromARGB(255, 58, 111, 226),
// );
Color kBlue = const Color.fromARGB(255, 58, 111, 226);
Color kPurple = const Color.fromARGB(255, 158, 123, 245);
Color kErreur = const Color.fromARGB(255, 226, 58, 58);

var kGradient = const LinearGradient(
  colors: [
    Color.fromARGB(255, 58, 111, 226),
    Color.fromARGB(255, 158, 123, 245),
  ],
  begin: Alignment.topLeft,
  end: Alignment.centerRight,
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 58, 111, 226),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      fixedSize: const Size(214, 53),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle:
          TextStyle(color: kPurple, fontWeight: FontWeight.bold, fontSize: 18),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme()
      .copyWith(headlineLarge: const TextStyle(color: Colors.white)),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomeScreen(),
    ),
  );
}
