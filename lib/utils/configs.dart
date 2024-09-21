import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

// final String baseUrl = dotenv.get("DAJUNG_TEST_URL");
final String baseUrl = dotenv.get("DAJUNG_BASE_URL");

class Config {
  factory Config() {
    return _singleton;
  }

  Config._internal();
  static final Config _singleton = Config._internal();

  String get nativeAppKey => env('NATIVE_APP_KEY');
}

String env(String key) {
  try {
    return dotenv.get(key);
  } on AssertionError catch (e) {
    if (e.message == 'A non-null fallback is required for missing entries') {
      logger.e(
        "'$key' Key does not exist. "
            "Make sure that the key exists in the '.env' file.",
      );
    }
    rethrow;
  }
}

var logger = Logger(
  printer: PrettyPrinter(
    lineLength: 120, // 기본값보다 더 긴 라인을 허용합니다.
    methodCount: 2, // 스택 추적에서 표시할 메소드 수를 조정합니다.
    errorMethodCount: 8, // 에러 발생 시 스택 추적에 표시할 메소드 수를 조정합니다.
  ),
);

class InitialSettings {

  static bool versionCheckPass = true;
  static Future init() async {
    // late String envFile;

    // const environment =
    //     String.fromEnvironment('environment', defaultValue: 'dev');
    //
    // // 파라미터에 따른 설정 파일 선택
    // switch (environment) {
    //   case "dev":
    //     envFile = "dev.env";
    //     break;
    //   case "prod":
    //     envFile = "prod.env";
    //     break;
    //   default:
    //     throw MissingPluginException("env 설정이 잘못되었습니다.");
    // }

// Firebase Remote Config를 통한 앱 버전 확인
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.setDefaults(const {
      'app_version': 2,
    });

    // Fetch the values from Firebase Remote Config
    await remoteConfig.fetchAndActivate();

    // Optional: listen for and activate changes to the Firebase Remote Config values
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
    });


// 앱 버전이 서버 버전보다 높아야, debug version에서 높여서 업데이트 테스팅이 가능 : >= 부호 주입
    await PackageInfo.fromPlatform().then((info) {
      versionCheckPass = int.parse(info.buildNumber) >= remoteConfig.getInt('app_version');
      logger.e('version : ${info.version} ,buildNumber : ${int.parse(info.buildNumber)} ,remoteConfig : ${remoteConfig.getInt(
          'app_version')} ,versionCheckPass : $versionCheckPass');
      return versionCheckPass;
    });
  }}