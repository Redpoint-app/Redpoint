import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redpoint/pages/home_page.dart';
import 'package:redpoint/pages/projects_page.dart';
import 'package:redpoint/widgets/layout/page_scaffold.dart';
import 'package:redpoint/widgets/nav/add_button.dart';
import 'package:redpoint/widgets/nav/bottom_navbar.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // TODO: Could probably persist pages so you don't have to rebuild each time pages switch. Could increase performance.

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
  PageTemplate currentPage = HomePage();

  @override
  Widget build(BuildContext context) {
    void setPage(PageTemplate page) {
      setState(() {
        currentPage = page;
      });
    }

    return Scaffold(
        extendBody: true,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            statusBarBrightness: Theme.of(context).brightness,
            statusBarIconBrightness:
                Theme.of(context).brightness == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          child: SafeArea(
            bottom: false,
            child: (currentPage.scrollable == true)
                ? SingleChildScrollView(child: currentPage.body)
                : currentPage.body,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const AddButton(),
        bottomNavigationBar:
            BottomNavbar(pageTitle: currentPage.title, callback: setPage));
  }
}
