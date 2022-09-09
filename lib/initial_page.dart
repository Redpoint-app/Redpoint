import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:redpoint/home/home_page.dart';
import 'package:redpoint/profile/profile_page.dart';
import 'package:redpoint/routes/routes_page.dart';
import 'package:redpoint/shared/providers/filter_change_notifier.dart';
import 'package:redpoint/shared/widgets/layout/page_template.dart';
import 'package:redpoint/shared/widgets/nav/add_button.dart';
import 'package:redpoint/shared/widgets/nav/bottom_navbar.dart';
import 'package:redpoint/social/social_page.dart';

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
      RoutesPage(),
      SocialPage(),
      ProfilePage(),
    ];

    final theme = Theme.of(context);
    final brightness = theme.brightness;

    return Scaffold(
      extendBody: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarBrightness: brightness,
          statusBarIconBrightness: brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        child: SafeArea(
          bottom: false,
          child: MultiProvider(
            providers: [
              Provider<InitialPageState>(create: (context) => this),
              ChangeNotifierProvider<FilterChangeNotifier>(
                create: (context) => FilterChangeNotifier(),
              ),
            ],
            child: IndexedStack(
              index: pageIndex,
              children: pages
                  .map((page) => page.scrollable == true
                      ? SingleChildScrollView(child: page.body)
                      : page.body)
                  .toList(),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const AddButton(),
      bottomNavigationBar: BottomNavbar(
        pageTitle: pages[pageIndex].title,
        callback: setPage,
      ),
    );
  }
}
