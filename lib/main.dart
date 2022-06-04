import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:redpoint/pages/home_page.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
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
            )),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue, foregroundColor: Colors.white),
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
          disabledColor: const Color.fromRGBO(73, 73, 73, 1),
          chipTheme: const ChipThemeData(
              selectedColor: Colors.blue,
              backgroundColor: Color.fromRGBO(73, 73, 73, 1),
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.blue, foregroundColor: Colors.white)),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
