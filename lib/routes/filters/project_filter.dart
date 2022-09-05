import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/route/route_status.dart';
import 'package:redpoint/routes/filters/filter.dart';

class ProjectFilter implements Filter {
  @override
  bool isValid(RouteData route) {
    return route.status == RouteStatusEnum.inProgress.index;
  }
}
