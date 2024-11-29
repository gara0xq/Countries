import 'package:countries/binding.dart';
import 'package:countries/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.transparent,
    primary: const Color(0xff202C37),
    secondary: const Color(0xff2B3945),
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 20,
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 16,
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Color(0xffFFFFFF),
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: Color(0xff858585),
    ),
  ),
);
ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.transparent,
    primary: const Color(0xFFD4D4D4),
    secondary: const Color(0xffFFFFFF),
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 20,
      color: Color(0xff111517),
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 16,
      color: Color(0xff111517),
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Color(0xff111517),
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: Color(0xff858585),
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      initialBinding: Binding(),
      home: HomeScreen(),
    );
  }
}
