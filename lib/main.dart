import 'package:tu_home/app/app.dart';
import 'package:tu_home/bootstrap.dart';

import 'package:tu_home/data/core/core.dart' as sl;

void main() {
  sl.configureDependencies();
  bootstrap(() async => const App());
}
