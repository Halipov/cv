import 'package:cv/config/app_config.dart';
import 'package:cv/config/environment/build_type.dart';
import 'package:cv/config/environment/environment.dart';
import 'package:cv/config/urls.dart';
import 'package:cv/runner.dart';

void main() async {
  Environment.init(
    buildType: BuildType.debug,
    config: AppConfig(
      url: Url.testUrl,
    ),
  );

  await run();
}
