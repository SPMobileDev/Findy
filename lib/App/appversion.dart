import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AppVersion with ChangeNotifier {
  String appVersion = '0.0.0';

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion =
        packageInfo.version; // Set the app version obtained from package_info
    notifyListeners();
  }
}
