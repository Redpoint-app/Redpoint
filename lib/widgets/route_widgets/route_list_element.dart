import 'package:flutter/material.dart';
import 'package:redpoint/model/route.dart';
import 'package:redpoint/widgets/shared/custom_icon_button.dart';

class RouteListElement extends StatefulWidget {
  const RouteListElement({super.key, required this.route});
  final ClimbingRoute route;

  @override
  State<RouteListElement> createState() => _RouteListElementState();
}

class _RouteListElementState extends State<RouteListElement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {},
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.route.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: CustomIconButton(
                            icon: Icons.more_horiz, size: 20, onTap: () {}),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${widget.route.type.label}, ${widget.route.grade}'),
                    Text(widget.route.getDateMessage()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
