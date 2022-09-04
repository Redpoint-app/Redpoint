import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redpoint/home/widgets/add_route_card.dart';
import 'package:redpoint/home/widgets/route_carousel.dart';
import 'package:redpoint/main.dart';
import 'package:redpoint/shared/model/yds.dart';

import 'package:redpoint/shared/model/difficulty.dart';
import 'package:redpoint/shared/model/route.dart';
import 'package:redpoint/shared/model/route_type.dart';
import 'package:redpoint/shared/model/status.dart';
import 'package:redpoint/shared/model/tag.dart';
import 'package:redpoint/shared/model/v_scale.dart';
import 'package:redpoint/shared/navigation/navigation.dart';
import 'package:redpoint/shared/widgets/layout/page_template.dart';

class HomePage extends PageTemplate {
  HomePage()
      : super(title: "Home", body: const _HomePageBody(), scrollable: true);
}

class _HomePageBody extends StatefulWidget {
  const _HomePageBody();

  @override
  State<_HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<_HomePageBody> {
  @override
  Widget build(BuildContext context) {
    ListQueue<Tag> tags = ListQueue();
    tags.add(Tag("Slopey"));
    tags.add(Tag("Slab"));
    tags.add(Tag("Dynamic"));
    tags.add(Tag("Crimpy"));
    tags.add(Tag("Comp"));

    List<ClimbingRoute> routes = [
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
    ];

    var initialPageState =
        Provider.of<InitialPageState>(context, listen: false);

    void viewAllProjects() {
      initialPageState.setPage(routesPageIndex);
    }

    return Column(
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
          onTapViewAll: viewAllProjects,
        ),
        RouteCarousel(
          title: "Recent climbs",
          routes: routes,
          emptyWidget: const AddRouteCard(),
          onTapViewAll: () {},
        ),
        RouteCarousel(
          title: "Friend activity",
          routes: routes,
          emptyWidget: const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text("No friend activity yet"),
          ),
          onTapViewAll: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 120),
        ),
      ],
    );
  }
}
