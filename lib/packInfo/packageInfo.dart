import 'package:package_info/package_info.dart';
// ignore: camel_case_types
class packageInfo {
  PackageInfo info;
  packageInfo() {
    initInfo();
  }

  void initInfo() async{
    info = await PackageInfo.fromPlatform();
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