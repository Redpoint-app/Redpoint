import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:redpoint/model/yds.dart';
import 'package:redpoint/widgets/layout/page_scaffold.dart';
import 'package:redpoint/widgets/route_widgets/add_route_card.dart';
import 'package:redpoint/widgets/route_widgets/route_carousel.dart';

import '../model/difficulty.dart';
import '../model/route.dart';
import '../model/route_type.dart';
import '../model/status.dart';
import '../model/tag.dart';
import '../model/v_scale.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ListQueue<Tag> tags = ListQueue();
    tags.add(Tag("Slopey"));
    tags.add(Tag("Slab"));
    tags.add(Tag("Dynamic"));
    tags.add(Tag("Crimpy"));
    tags.add(Tag("Comp"));

    List<ClimbingRoute> routes = [
      /*
      ClimbingRoute(
          "Big Orange",
          DateTime.parse("2019-06-26"),
          RouteType.boulder,
          const VScale().getScale()[5],
          Status.inProgress,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Ka-blue-ey",
          DateTime.parse("2022-06-07"),
          RouteType.topRope,
          const YDS().getScale()[8],
          Status.inProgress,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Alex Handhold and the Chrisp Sharma",
          DateTime.parse("2022-05-29"),
          RouteType.lead,
          const YDS().getScale()[10],
          Status.inProgress,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "This is a super long title for this climbing route",
          DateTime.parse("2022-01-29"),
          RouteType.boulder,
          const VScale().getScale()[8],
          Status.inProgress,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
          */
    ];

    return PageScaffold(
      title: "Home",
      body: Column(
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
          RouteCarousel(
            title: "Projects",
            routes: routes,
            emptyWidget: const AddRouteCard(),
          ),
          RouteCarousel(
            title: "Recent climbs",
            routes: routes,
            emptyWidget: const AddRouteCard(),
          ),
          RouteCarousel(
            title: "Friend activity",
            routes: routes,
            emptyWidget: const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text("No friend activity yet"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 120),
          ),
        ],
      ),
    );
  }
}
