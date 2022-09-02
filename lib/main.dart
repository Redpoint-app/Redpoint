import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:redpoint/home/home_page.dart';
import 'package:redpoint/profile/profile_page.dart';
import 'package:redpoint/projects/projects_page.dart';
import 'package:redpoint/shared/widgets/layout/page_template.dart';
import 'package:redpoint/shared/widgets/nav/add_button.dart';
import 'package:redpoint/shared/widgets/nav/bottom_navbar.dart';
import 'package:redpoint/social/social_page.dart';

import 'package:storage_inspector/storage_inspector.dart';
import 'package:drift_local_storage_inspector/drift_local_storage_inspector.dart';

import 'database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final driftDb = AppDatabase();

  // Run storage_inspector in debug mode only
  if (kDebugMode) {
    final driver = StorageServerDriver(bundleId: 'com.example.redpoint');
    final sqlServer =
        DriftSQLDatabaseServer(id: "1", name: "SQL Server", database: driftDb);

    driver.addSQLServer(sqlServer);
    await driver.start();
  }

  var providers = MultiProvider(
    providers: [
      Provider<AppDatabase>(
          create: (context) => driftDb, dispose: (context, db) => db.close())
    ],
    child: const App(),
  );

  runApp(providers);
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
  State<InitialPage> createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  int pageIndex = 0;

  void setPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<PageTemplate> pages = [
      HomePage(),
      ProjectsPage(),
      SocialPage(),
      ProfilePage()
    ];

    return Provider<InitialPageState>(
        create: (context) => this,
        child: Scaffold(
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
                child: IndexedStack(
                  index: pageIndex,
                  children: pages
                      .map((page) => (page.scrollable == true)
                          ? SingleChildScrollView(child: page.body)
                          : page.body)
                      .toList(),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const AddButton(),
            bottomNavigationBar: BottomNavbar(
                pageTitle: pages[pageIndex].title, callback: setPage)));
  }
}
