import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../pages/add_page.dart';

class AddRouteCard extends StatefulWidget {
  const AddRouteCard({super.key});

  @override
  State<AddRouteCard> createState() => _AddRouteCardState();
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AddPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

class _AddRouteCardState extends State<AddRouteCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34, top: 4),
      child: InkWell(
        highlightColor: Theme.of(context).primaryColor.withOpacity(0.2),
        splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
        child: DottedBorder(
          color: Theme.of(context).primaryColor,
          strokeWidth: 2,
          dashPattern: const [10, 10],
          child: SizedBox(
            width: 260,
            height: 238,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Add Route",
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  ),
                ),
                Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
