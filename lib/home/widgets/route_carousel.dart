import 'package:flutter/material.dart';
import 'package:redpoint/home/widgets/route_card.dart';
import 'package:redpoint/shared/model/route.dart';

class RouteCarousel extends StatefulWidget {
  const RouteCarousel({
    super.key,
    required this.routes,
    required this.title,
    required this.emptyWidget,
    required this.onTapViewAll,
  });
  final List<ClimbingRoute> routes;
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
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: widget.onTapViewAll,
                  child: Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.routes.isEmpty) widget.emptyWidget,
          if (widget.routes.isNotEmpty)
            SizedBox(
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.routes.length,
                itemBuilder: (BuildContext context, int index) {
                  return RouteCard(
                      route: widget.routes[index],
                      first: index == 0,
                      last: index == (widget.routes.length - 1));
                },
              ),
            ),
        ],
      ),
    );
  }
}
