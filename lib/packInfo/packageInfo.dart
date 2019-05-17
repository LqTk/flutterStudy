import 'package:package_info/package_info.dart';
// ignore: camel_case_types
class packageInfo {
  static PackageInfo info;
  packageInfo();

  static Future<packageInfo> initInfo() async{
    info = await PackageInfo.fromPlatform();
    return packageInfo();
  }

  String getPackAppName(){
    initInfo();
    return info.appName;
  }
  String getVersion(){
    initInfo();
    return info.version;
  }
  String getPackAgeName(){
    initInfo();
    return info.packageName;
  }
  String getPackBuildNum(){
    initInfo();
    return info.buildNumber;
  }

}