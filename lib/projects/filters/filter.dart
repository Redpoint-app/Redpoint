import 'package:redpoint/shared/model/route.dart';

abstract class Filter {
  bool isValid(ClimbingRoute route);
}
