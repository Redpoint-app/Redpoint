import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/routes/widgets/filter/filter_bar.dart';
import 'package:redpoint/routes/widgets/route_list_element.dart';
import 'package:redpoint/shared/providers/filter_change_notifier.dart';
import 'package:redpoint/shared/widgets/custom_icon_button.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';
import 'package:redpoint/shared/widgets/layout/page_template.dart';

class RoutesPage extends PageTemplate {
  RoutesPage()
      : super(
          title: "Routes",
          body: const _RoutesPageBody(),
          scrollable: true,
        );
}

class _RoutesPageBody extends StatefulWidget {
  const _RoutesPageBody();

  @override
  State<_RoutesPageBody> createState() => _RoutesPageBodyState();
}

class _RoutesPageBodyState extends State<_RoutesPageBody> {
  @override
  Widget build(BuildContext context) {
    var db = Provider.of<AppDatabase>(context, listen: false);
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 36, bottom: 24, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: Icons.filter_alt_outlined,
                size: IconDimensions.xl,
                onTap: () {
                  // TODO
                },
              ),
              CustomIconButton(
                icon: Icons.search,
                size: IconDimensions.xl,
                onTap: () {
                  // TODO
                },
              ),
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
            builder: (context, filterChangeNotifier, child) =>
                StreamBuilder<List<RouteData>>(
              stream: db.routeDao.watchAll,
              builder: (
                BuildContext context,
                AsyncSnapshot<List<RouteData>> snapshot,
              ) {
                if (snapshot.hasError) {
                  return const Text("Error getting routes.");
                } else {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      return Column(
                        children: snapshot.data!
                            .where((route) => filterChangeNotifier.filters
                                .every((filter) => filter.isValid(route)))
                            .map((RouteData route) =>
                                RouteListElement(route: route))
                            .toList(),
                      );
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
