import 'package:flutter/material.dart';
import 'package:redpoint/model/route.dart';

class RouteListElement extends StatefulWidget {
  const RouteListElement({super.key, required this.route});
  final ClimbingRoute route;

  @override
  State<RouteListElement> createState() => _RouteListElementState();
}

class _RouteListElementState extends State<RouteListElement> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.route.title),
      Text(widget.route.getDateMessage()),
      ]);
  }
}
