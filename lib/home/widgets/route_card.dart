import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/climb_type/climb_type.dart';
import 'package:redpoint/database/models/tag/tag.dart';
import 'package:redpoint/shared/methods/local_date_util.dart';

class RouteCard extends StatefulWidget {
  const RouteCard({
    super.key,
    required this.route,
    this.tags,
    this.first,
    this.last,
  });
  final RouteData route;
  final List<TagEnum>? tags;
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

    var db = Provider.of<AppDatabase>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
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
                        "${ClimbTypeEnum.values[widget.route.climbTypeId].label}, ${widget.route.grade}",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: FutureBuilder<List<int>>(
                        future:
                            db.routeTagDao.getTagIdsByRouteId(widget.route.id),
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<List<int>> snapshot,
                        ) {
                          return Wrap(
                            runSpacing: -10,
                            spacing: 4,
                            children: snapshot.data
                                    ?.map((int tagId) => Chip(
                                          label: Text(
                                            TagEnum.values[tagId].label,
                                          ),
                                        ))
                                    .toList() ??
                                [],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text(pastDateMessage(widget.route.date)),
            ],
          ),
        ),
      ),
    );
  }
}
