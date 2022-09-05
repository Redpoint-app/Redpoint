import 'package:redpoint/database/database.dart';

abstract class Filter {
  bool isValid(RouteData route);
}
