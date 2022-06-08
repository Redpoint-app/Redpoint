import 'dart:math';

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
    return PageScaffold(
        title: "Home",
        body: SafeArea(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 40, left: 30),
                child: Text(
                  "Good ${(DateTime.now().hour >= 12) ? "afternoon" : "morning"},\nUser",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: min(MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height) *
                          .08),
                )),
          ],
        )));
  }
}
