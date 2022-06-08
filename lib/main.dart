import 'package:flutter/material.dart';
import 'package:redpoint/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redpoint',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        disabledColor: const Color.fromRGBO(220, 220, 220, 1),
        chipTheme: const ChipThemeData(
          selectedColor: Colors.blue,
          backgroundColor: Color.fromRGBO(220, 220, 220, 1),
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          secondaryLabelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue, foregroundColor: Colors.white),
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          disabledColor: const Color.fromRGBO(73, 73, 73, 1),
          chipTheme: const ChipThemeData(
            selectedColor: Colors.blue,
            backgroundColor: Color.fromRGBO(73, 73, 73, 1),
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          cardTheme: const CardTheme(
            color: Color.fromRGBO(58, 58, 58, 1),
          ),
          sliderTheme: const SliderThemeData(
            valueIndicatorColor: Color.fromRGBO(73, 73, 73, 1),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.blue, foregroundColor: Colors.white)),
      themeMode: ThemeMode.system,
      home: const InitialPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});
  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
