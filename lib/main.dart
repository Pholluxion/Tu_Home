import 'package:tu_home/app/app.dart';
import 'package:tu_home/bootstrap.dart';

import 'app/data/services/service_locator.dart' as sl;

void main() {
  sl.configureDependencies();
  bootstrap(() async => const App());
}
