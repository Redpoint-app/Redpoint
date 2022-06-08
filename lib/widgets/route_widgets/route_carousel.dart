import 'package:flutter/material.dart';
import 'package:redpoint/model/route.dart';
import 'package:redpoint/widgets/route_widgets/route_card.dart';

class RouteCarousel extends StatefulWidget {
  const RouteCarousel({super.key, required this.routes});
  final List<ClimbingRoute> routes;

  @override
  State<RouteCarousel> createState() => _RouteCarouselState();
}

class _RouteCarouselState extends State<RouteCarousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.routes.length,
        itemBuilder: (BuildContext context, int index) {
          double leftPadding = index == 0 ? 30 : 0;
          double rightPadding = index == (widget.routes.length - 1) ? 30 : 0;

          return Padding(
            padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
            child: RouteCard(route: widget.routes[index]));
        },
      ),
    );
  }
}
