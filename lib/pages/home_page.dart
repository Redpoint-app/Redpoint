import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:redpoint/widgets/layout/page_scaffold.dart';
import 'package:redpoint/widgets/route_widgets/route_carousel.dart';

import '../model/difficulty.dart';
import '../model/route.dart';
import '../model/route_type.dart';
import '../model/status.dart';
import '../model/v_scale.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<ClimbingRoute> routes = [
      ClimbingRoute(
          "Big Red",
          DateTime.now(),
          RouteType.boulder,
          const VScale().getScale()[0],
          Status.inProgress,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "Ka-blue-ey",
          DateTime.now(),
          RouteType.topRope,
          const VScale().getScale()[0],
          Status.inProgress,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "Alex Handhold and the Chrisp Sharma",
          DateTime.now(),
          RouteType.lead,
          const VScale().getScale()[0],
          Status.inProgress,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "Big Orange",
          DateTime.now(),
          RouteType.boulder,
          const VScale().getScale()[0],
          Status.inProgress,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
    ];

    return PageScaffold(
      title: "Home",
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, bottom: 20),
              child: Text(
                "Good ${(DateTime.now().hour >= 12) ? "afternoon" : "morning"},\nUser",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: min(MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height) *
                        .08),
              ),
            ),
            RouteCarousel(routes: routes),
          ],
        ),
      ),
    );
  }
}
