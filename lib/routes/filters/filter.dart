import 'package:redpoint/shared/model/route.dart';

abstract class Filter {
  Filter({required this.label});
  final String label;
  bool isValid(ClimbingRoute route);
}
