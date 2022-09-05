import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:redpoint/routes/widgets/filter/filter_bar.dart';
import 'package:redpoint/routes/widgets/route_list_element.dart';
import 'package:provider/provider.dart';

import 'package:redpoint/shared/model/difficulty.dart';
import 'package:redpoint/shared/model/route.dart';
import 'package:redpoint/shared/model/route_type.dart';
import 'package:redpoint/shared/model/status.dart';
import 'package:redpoint/shared/model/tag.dart';
import 'package:redpoint/shared/model/v_scale.dart';
import 'package:redpoint/shared/model/yds.dart';
import 'package:redpoint/shared/providers/filter_change_notifier.dart';
import 'package:redpoint/shared/widgets/custom_icon_button.dart';
import 'package:redpoint/shared/widgets/layout/page_template.dart';

class RoutesPage extends PageTemplate {
  RoutesPage()
      : super(title: "Routes", body: const _RoutesPageBody(), scrollable: true);
}

class _RoutesPageBody extends StatefulWidget {
  const _RoutesPageBody();

  @override
  State<_RoutesPageBody> createState() => _RoutesPageBodyState();
}

class _RoutesPageBodyState extends State<_RoutesPageBody> {
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
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Alex Handhold and the Chrisp Sharma",
          DateTime.parse("2022-05-29"),
          RouteType.lead,
          const YDS().getScale()[10],
          Status.wantToTry,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "This is a super long title for this climbing route",
          DateTime.parse("2022-01-29"),
          RouteType.boulder,
          const VScale().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Big Orange",
          DateTime.parse("2019-06-26"),
          RouteType.boulder,
          const VScale().getScale()[5],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Ka-blue-ey",
          DateTime.parse("2022-06-07"),
          RouteType.topRope,
          const YDS().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Alex Handhold and the Chrisp Sharma",
          DateTime.parse("2022-05-29"),
          RouteType.lead,
          const YDS().getScale()[10],
          Status.wantToTry,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "This is a super long title for this climbing route",
          DateTime.parse("2022-01-29"),
          RouteType.boulder,
          const VScale().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Big Orange",
          DateTime.parse("2019-06-26"),
          RouteType.boulder,
          const VScale().getScale()[5],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Ka-blue-ey",
          DateTime.parse("2022-06-07"),
          RouteType.topRope,
          const YDS().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Alex Handhold and the Chrisp Sharma",
          DateTime.parse("2022-05-29"),
          RouteType.lead,
          const YDS().getScale()[10],
          Status.wantToTry,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "This is a super long title for this climbing route",
          DateTime.parse("2022-01-29"),
          RouteType.boulder,
          const VScale().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Big Orange",
          DateTime.parse("2019-06-26"),
          RouteType.boulder,
          const VScale().getScale()[5],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Ka-blue-ey",
          DateTime.parse("2022-06-07"),
          RouteType.topRope,
          const YDS().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Alex Handhold and the Chrisp Sharma",
          DateTime.parse("2022-05-29"),
          RouteType.lead,
          const YDS().getScale()[10],
          Status.wantToTry,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "This is a super long title for this climbing route",
          DateTime.parse("2022-01-29"),
          RouteType.boulder,
          const VScale().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Big Orange",
          DateTime.parse("2019-06-26"),
          RouteType.boulder,
          const VScale().getScale()[5],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Ka-blue-ey",
          DateTime.parse("2022-06-07"),
          RouteType.topRope,
          const YDS().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Alex Handhold and the Chrisp Sharma",
          DateTime.parse("2022-05-29"),
          RouteType.lead,
          const YDS().getScale()[10],
          Status.wantToTry,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "This is a super long title for this climbing route",
          DateTime.parse("2022-01-29"),
          RouteType.boulder,
          const VScale().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Big Orange",
          DateTime.parse("2019-06-26"),
          RouteType.boulder,
          const VScale().getScale()[5],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Ka-blue-ey",
          DateTime.parse("2022-06-07"),
          RouteType.topRope,
          const YDS().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Alex Handhold and the Chrisp Sharma",
          DateTime.parse("2022-05-29"),
          RouteType.lead,
          const YDS().getScale()[10],
          Status.wantToTry,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "This is a super long title for this climbing route",
          DateTime.parse("2022-01-29"),
          RouteType.boulder,
          const VScale().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Big Orange",
          DateTime.parse("2019-06-26"),
          RouteType.boulder,
          const VScale().getScale()[5],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Ka-blue-ey",
          DateTime.parse("2022-06-07"),
          RouteType.topRope,
          const YDS().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
      ClimbingRoute(
          "Alex Handhold and the Chrisp Sharma",
          DateTime.parse("2022-05-29"),
          RouteType.lead,
          const YDS().getScale()[10],
          Status.wantToTry,
          null,
          Difficulty.easy,
          ListQueue(),
          "This askjasklj"),
      ClimbingRoute(
          "This is a super long title for this climbing route",
          DateTime.parse("2022-01-29"),
          RouteType.boulder,
          const VScale().getScale()[8],
          Status.wantToTry,
          null,
          Difficulty.easy,
          tags,
          "This askjasklj"),
    ];

    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 36, bottom: 24, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                  icon: Icons.filter_alt_outlined, size: 28, onTap: () {}),
              CustomIconButton(
                icon: Icons.search,
                size: 28,
                onTap: () {},
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Routes",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 20), child: FilterBar()),
        Padding(
            padding: const EdgeInsets.only(bottom: 140),
            child: Consumer<FilterChangeNotifier>(
                builder: (context, filterChangeNotifier, child) {
              return Column(
                  children: routes
                      .where((route) => filterChangeNotifier.filters
                          .every((filter) => filter.isValid(route)))
                      .map((ClimbingRoute route) =>
                          RouteListElement(route: route))
                      .toList());
            }))
      ],
    );
  }
}
