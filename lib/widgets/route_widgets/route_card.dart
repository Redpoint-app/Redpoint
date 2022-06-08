import 'package:flutter/material.dart';
import 'package:redpoint/model/route.dart';

class RouteCard extends StatefulWidget {
  const RouteCard({super.key, required this.route, this.first, this.last});
  final ClimbingRoute route;
  final bool? first;
  final bool? last;

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  String getDateMessage(DateTime date) {
    DateTime now = DateTime.now();
    Duration diff = now.difference(date).abs();

    if (diff.inMinutes < 1) {
      return "A few seconds ago";
    } else if (diff.inHours < 1) {
      return "A few minutes ago";
    } else if (diff.inDays < 1) {
      return "A few hours ago";
    } else if (diff.inDays == 1) {
      return "Yesterday";
    } else if (diff.inDays < 7) {
      return "A few days ago";
    } else if (diff.inDays < 14) {
      return "Last week";
    } else if (diff.inDays < 30) {
      return "A few weeks ago";
    } else {
      // Days > 30
      int yearDiff = (date.year - now.year).abs();

      if (yearDiff <= 1) {
        int monthDiff = yearDiff == 1 ? (now.month + (12 - date.month)) : (now.month - date.month).abs();

        if (monthDiff == 0) {
          return "A few weeks ago";
        } else if (monthDiff == 1) {
          return "Last month";
        } else if (monthDiff < 12) {
          return "$monthDiff months ago";
        } else {
          return "Last year";
        }
      } else {
        return "$yearDiff years ago";
      }
    }
  }

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
              Text(getDateMessage(widget.route.date)),
            ],
          ),
        ),
      ),
    );
  }
}
