import 'package:cv/config/environment/environment.dart';

/// Server urls.
class Url {
  Url._();
  static String get testUrl => '';
  static String get prodUrl => '';
  static String get devUrl => '';
  static String get baseUrl => Environment.instance().config.url;
}
