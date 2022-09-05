import 'package:redpoint/database/database.dart';

abstract class Filter {
  Filter({required this.label});
  final String label;
  bool isValid(RouteData route);
}
