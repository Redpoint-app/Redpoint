import 'package:flutter/material.dart';
import 'package:redpoint/shared/model/route.dart';

class RouteCard extends StatefulWidget {
  const RouteCard({super.key, required this.route, this.first, this.last});
  final ClimbingRoute route;
  final bool? first;
  final bool? last;

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  @override
  Widget build(BuildContext context) {
    double padding = 4;
    double firstLastPadding = 30;
    double leftPadding = padding;
    double rightPadding = padding;

    if (widget.first ?? false) {
      leftPadding = firstLastPadding;
    }

    if (widget.last ?? false) {
      rightPadding = firstLastPadding;
    }

    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        widget.route.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "${widget.route.type.label}, ${widget.route.grade}",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Wrap(
                        runSpacing: -10,
                        spacing: 4,
                        children: widget.route.tags
                            .map((element) => Chip(
                                  label: Text(element.label),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Text(widget.route.getDateMessage()),
            ],
          ),
        ),
      ),
    );
  }
}
