import 'package:simple_remote_config/simple_remote_config.dart';
import 'package:version/version.dart';

Future<void> main() async {
  final remoteConfig = SimpleRemoteConfig();

  const configUrl = "https://dungngminh.github.io/remote_config/test.json";

  await remoteConfig.initilize(configUrl: configUrl);

  final maxQuota = remoteConfig.getInt("maxQuota");
  print("maxQuota: $maxQuota");

  final enableLog = remoteConfig.getBool("enableLog");

  if (enableLog ?? false) {
    print("Log is enabled");
  }

  final inAppVersion = Version.parse("1.0.0");

  final currentVersion = remoteConfig.getString("currentVersion");

  if (currentVersion != null && inAppVersion < Version.parse(currentVersion)) {
    print("Please update your app");
  } else {
    print("You are using the latest version");
  }
}
