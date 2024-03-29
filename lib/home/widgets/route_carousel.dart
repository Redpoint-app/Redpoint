import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/home/widgets/route_card.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';

class RouteCarousel extends StatefulWidget {
  const RouteCarousel({
    super.key,
    required this.routes,
    required this.title,
    required this.emptyWidget,
    required this.onTapViewAll,
  });
  final Stream<List<RouteData>> routes;
  final String title;
  final Widget emptyWidget;
  final void Function() onTapViewAll;

  @override
  State<RouteCarousel> createState() => _RouteCarouselState();
}

class _RouteCarouselState extends State<RouteCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: TextDimensions.subHeader,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: widget.onTapViewAll,
                  child: Text(
                    "View all",
                    style: TextStyle(
                      fontSize: TextDimensions.subHeader,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: CardDimensions.heightLarge,
            child: StreamBuilder<List<RouteData>>(
              stream: widget.routes,
              builder: (
                BuildContext context,
                AsyncSnapshot<List<RouteData>> snapshot,
              ) {
                if (snapshot.hasError) {
                  return const Text("Error getting routes.");
                } else {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return widget.emptyWidget;
                    case ConnectionState.waiting:
                      return const SizedBox(
                        width: CardDimensions.heightLarge,
                        child: Padding(
                          padding: EdgeInsets.all(75),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      return snapshot.data!.isEmpty
                          ? widget.emptyWidget
                          : ListView(
                              scrollDirection: Axis.horizontal,
                              children: snapshot.data!
                                  .mapIndexed(
                                    (int index, RouteData route) => RouteCard(
                                      route: route,
                                      first: index == 0,
                                      last:
                                          index == (snapshot.data!.length - 1),
                                    ),
                                  )
                                  .toList(),
                            );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
