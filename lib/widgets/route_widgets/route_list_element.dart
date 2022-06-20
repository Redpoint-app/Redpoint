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
    return Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.route.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(widget.route.getDateMessage()),
                  )
                ],
              )
            ])));
  }
}
