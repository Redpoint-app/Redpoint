import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/home/widgets/add_route_card.dart';
import 'package:redpoint/home/widgets/route_carousel.dart';
import 'package:redpoint/initial_page.dart';
import 'package:redpoint/routes/filters/project_filter.dart';
import 'package:redpoint/shared/methods/local_date_util.dart';
import 'package:redpoint/shared/navigation/navigation.dart';
import 'package:redpoint/shared/providers/filter_change_notifier.dart';
import 'package:redpoint/shared/widgets/layout/page_template.dart';

class HomePage extends PageTemplate {
  HomePage()
      : super(
          title: "Home",
          body: const _HomePageBody(),
          scrollable: true,
        );
}

class _HomePageBody extends StatefulWidget {
  const _HomePageBody();

  @override
  State<_HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<_HomePageBody> {
  @override
  Widget build(BuildContext context) {
    var db = Provider.of<AppDatabase>(context, listen: false);
    var initialPageState =
        Provider.of<InitialPageState>(context, listen: false);
    var filterNotifier =
        Provider.of<FilterChangeNotifier>(context, listen: false);

    void viewAllProjects() {
      initialPageState.setPage(routesPageIndex);
      filterNotifier.add<ProjectFilter>(ProjectFilter());
    }

    final mediaSize = MediaQuery.of(context).size;
    const numRoutesDisplayed = 5;
    const fontScale = 0.08;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, bottom: 20),
          child: Text(
            "Good ${(DateTime.now().hour >= hoursInHalfDay) ? "afternoon" : "morning"},\nUser",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: min(
                    mediaSize.width,
                    mediaSize.height,
                  ) *
                  fontScale,
            ),
          ),
        ),
        RouteCarousel(
          title: "Projects",
          routes: db.routeDao.getLatestProjects(numRoutesDisplayed),
          emptyWidget: const AddRouteCard(),
          onTapViewAll: viewAllProjects,
        ),
        RouteCarousel(
          title: "Recent climbs",
          routes: db.routeDao.getRecentClimbs(numRoutesDisplayed),
          emptyWidget: const AddRouteCard(),
          onTapViewAll: () {
            // TODO
          },
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 120),
        ),
      ],
    );
  }
}
