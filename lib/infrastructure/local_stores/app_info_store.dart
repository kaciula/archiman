import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInfoStore {
  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<AppInfo> get() async {
    final bool isFirstTime = prefs.getBool(_keyIsFirstTime) ?? true;
    final int oldVersionCode = prefs.getInt(_keyVersionCode) ?? 1;
    final int currentVersionCode = await _currentVersionCode();
    return AppInfo(isFirstTime, oldVersionCode, currentVersionCode);
  }

  Future<void> save(
      {required bool isFirstTime, required int versionCode}) async {
    await prefs.setBool(_keyIsFirstTime, isFirstTime);
    await prefs.setInt(_keyVersionCode, versionCode);
  }

  Future<int> _currentVersionCode() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return int.parse(packageInfo.buildNumber);
  }

  Future<String> currentVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return '${packageInfo.version} (${packageInfo.buildNumber})';
  }
}

const String _keyIsFirstTime = 'isFirstTime';
const String _keyVersionCode = 'versionCode';

class AppInfo {
  AppInfo(this.isFirstTime, this.oldVersionCode, this.currentVersionCode);

  final bool isFirstTime;
  final int oldVersionCode;
  final int currentVersionCode;
}
