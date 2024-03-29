import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:redpoint/add_route/add_page.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';

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

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _AddRouteCardState extends State<AddRouteCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final transparentPrimaryColor = primaryColor.withOpacity(0.2);

    const widthDifference = 30;
    const heightDifference = -12;

    return Padding(
      padding: const EdgeInsets.only(left: 34, top: 4),
      child: InkWell(
        highlightColor: transparentPrimaryColor,
        splashColor: transparentPrimaryColor,
        onTap: () => Navigator.of(context).push(_createRoute()),
        child: DottedBorder(
          color: primaryColor,
          strokeWidth: 2,
          dashPattern: const [10, 10],
          child: SizedBox(
            width: CardDimensions.widthLarge + widthDifference,
            height: CardDimensions.heightLarge + heightDifference,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Add Route",
                    style: TextStyle(
                      fontSize: TextDimensions.header,
                      color: primaryColor,
                    ),
                  ),
                ),
                Icon(
                  Icons.add,
                  color: primaryColor,
                  size: IconDimensions.xl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
