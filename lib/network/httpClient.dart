import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_app1/packInfo/packageInfo.dart';
import 'package:package_info/package_info.dart';
// ignore: camel_case_types
class httpClient {
  //配置dio实例
  static Dio dio;
  PackageInfo info;

  httpClient(){
    getPackage();
  }

  void getPackage() async{
    info = await PackageInfo.fromPlatform();
    getInstance();
  }

  void getInstance(){
    if(dio == null) {
      dio = new Dio(new BaseOptions(
        baseUrl: 'https://cloud.synwing.com:8443/health_app_v2/',
        connectTimeout: 5000,
        receiveTimeout: 100000,
        headers: {
          'App-Version': info.version,
          'App-Type': 'SYN_HEALTH_CONSUMER',
          'accept': 'application/json',
        },
        contentType: ContentType.json,
        responseType: ResponseType.json,
      ));
    }
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
      client.badCertificateCallback=(X509Certificate cert, String host, int port){
        return true;//信任所有证书
      };
    };
  }

  void logoIn (String url, String name,String passWord) async{
    print('进入login,name=$name,passWord=$passWord');
    url = 'noAuth/users/pwd/login?';
    Response response;
    response = await dio.post(url,data: {'login':name,'pwd':passWord,'uniqueCode':'111111','appType':'SYN_HEALTH_CONSUMER'});
    print(response.data.toString()+',结果');
  }

  void updata(String url,String type,String osType) async{
    String baseUrl = dio.options.baseUrl;
    print('请求的URL=$baseUrl$url$type?osType=$osType');
    Response response;
    response = await dio.get(url+'$type?osType=$osType');
    print(response.data.toString()+',updata结果');
  }

  Future<String> getUserInfo(String url,String userId) async{
    String baseUrl = dio.options.baseUrl;
    print('请求的URL=$baseUrl$url$userId');
    print('请求头信息'+dio.options.headers.toString());
    print('包信息:packAgeName='+info.packageName+',AppName='+info.appName+',BuildNum='+info.buildNumber+',version='+info.version);
    Response response;
    response = await dio.get(url+'$userId');
    print(response.data.toString()+',userInfo结果');
    return response.data.toString();
  }

}