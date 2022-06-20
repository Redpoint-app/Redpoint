import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:redpoint/widgets/layout/page_template.dart';
import 'package:redpoint/widgets/route_widgets/route_list_element.dart';

import '../model/difficulty.dart';
import '../model/route.dart';
import '../model/route_type.dart';
import '../model/status.dart';
import '../model/tag.dart';
import '../model/v_scale.dart';
import '../model/yds.dart';

class ProjectsPage extends PageTemplate {
  ProjectsPage() : super(title: "Projects", body: const _ProjectsPageBody());
}

class _ProjectsPageBody extends StatefulWidget {
  const _ProjectsPageBody({super.key});

  @override
  State<_ProjectsPageBody> createState() => _ProjectsPageBodyState();
}

class _ProjectsPageBodyState extends State<_ProjectsPageBody> {
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

    return 
      Column(
        children: <Widget>[
          Row(children: [
            ChoiceChip(label: Text("On sight"), selected: false),
          ],),
          Divider(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: routes.length * 10,
              itemBuilder: (BuildContext context, int index) {
                return RouteListElement(
                  route: routes[index % 4],
                );
              },
            ),
          ),
        ],
    );
  }
}
