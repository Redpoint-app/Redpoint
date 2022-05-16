import 'package:flutter/material.dart';
import 'package:redpoint/widgets/layout/page_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
        title: "Home",
        body: Center(
          child: Text("Home"),
        ));
  }
}
