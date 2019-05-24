import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_app1/packInfo/packageInfo.dart';
import 'package:flutter_app1/sharePreferences/sharePreference.dart';
import 'package:package_info/package_info.dart';
// ignore: camel_case_types
class httpClient {
  //配置dio实例
  static Dio dio;
  packageInfo info;
  sharePreference preference;
  String deviceType;

  httpClient(){
    getPackage();
  }

  void getPackage() async{
    info = await packageInfo.initInfo();
    preference = await sharePreference.getInstance();
    if(Platform.isAndroid){
      deviceType = 'Android';
    }else if(Platform.isIOS){
      deviceType = 'IOS';
    }
    getInstance();
  }

  void getInstance(){
    if(dio == null) {
      /*dio = new Dio(new BaseOptions(
        baseUrl: 'https://cloud.synwing.com:8443/health_app_v2/',
        connectTimeout: 5000,
        receiveTimeout: 100000,
        headers: {
          'App-Version': info.getVersion(),
          'App-Type': 'SYN_HEALTH_CONSUMER',
          'accept': 'application/json',
        },
        contentType: ContentType.json,
        responseType: ResponseType.json,
      ));*/
      dio = new Dio(new BaseOptions(
        baseUrl: 'https://www.apiopen.top/',
        connectTimeout: 5000,
        receiveTimeout: 100000,
        responseType: ResponseType.json
      ));
    }
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
      client.badCertificateCallback=(X509Certificate cert, String host, int port){
        return true;//信任所有证书
      };
    };
  }

  void logoIn (String url, String name,String passWord) async{
    preference.setString('name', name);
    print('进入login,name=$name,passWord=$passWord');
    url = 'noAuth/users/pwd/login?';
    Response response;
    response = await dio.post(url,data: {'login':name,'pwd':passWord,'uniqueCode':'111111','appType':'SYN_HEALTH_CONSUMER'});
    print(response.data.toString()+',结果');
  }

  void updata(String url,String type) async{
    String baseUrl = dio.options.baseUrl;
    print('请求的URL=$baseUrl$url$type?osType=$deviceType');
    Response response;
    response = await dio.get(url+'$type?osType=$deviceType');
    print(response.data.toString()+',updata结果');
  }

  Future<String> getUserInfo(String url,String userId) async{
    String baseUrl = dio.options.baseUrl;
    print('请求的URL=$baseUrl$url$userId');
    print('请求头信息'+dio.options.headers.toString());
    print('包信息:packAgeName='+info.getPackAgeName()+',AppName='+info.getPackAppName()+',BuildNum='+info.getPackBuildNum()+',version='+info.getVersion());
    Response response;
    response = await dio.get(url+'$userId');
    print(response.data.toString()+',userInfo结果');
    return response.data.toString();
  }

  Future<Response> getWeaather(String url,String city) async{
    print(dio.options.baseUrl+'$url?city=$city');
    Response response = await dio.get("$url?city=$city");
    return response;
  }

}