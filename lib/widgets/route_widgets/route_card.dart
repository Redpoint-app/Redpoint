import 'package:flutter/material.dart';
import 'package:redpoint/model/route.dart';

class RouteCard extends StatefulWidget {
  const RouteCard({super.key, required this.route});
  final ClimbingRoute route;

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 200,
        child:
        Column(
        children: [
          Text(widget.route.title),
          Text(widget.route.type.label),
        ],
      )),
    );
  }
}