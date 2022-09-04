import 'package:redpoint/projects/filters/filter.dart';
import 'package:redpoint/shared/model/route.dart';
import 'package:redpoint/shared/model/status.dart';

class ProjectFilter implements Filter {
  @override
  bool isValid(ClimbingRoute route) {
    return route.status == Status.inProgress;
  }
}
