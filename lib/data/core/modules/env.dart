import 'package:injectable/injectable.dart';

@singleton
class EnvManger {
  String get baseUrl => const String.fromEnvironment('URL');
}
