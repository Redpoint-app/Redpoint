import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:redpoint/widgets/layout/page_scaffold.dart';

import '../model/difficulty.dart';
import '../model/route.dart';
import '../model/route_type.dart';
import '../model/status.dart';
import '../model/tag.dart';
import '../model/v_scale.dart';
import '../model/yds.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
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

    return PageScaffold(
      title: "Projects",
      body: Column(
        children: <Widget>[
          Text("data"),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: routes.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(height: 500, width: 100, color: Colors.red,);
              },
            ),
        ],
      ),
    );
  }
}
