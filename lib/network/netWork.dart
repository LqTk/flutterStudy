import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app1/ChangePage.dart';
import 'package:flutter_app1/network/httpClient.dart';
import 'package:flutter_app1/network/weather/Weather.dart';
import 'package:flutter_app1/network/weather/WeatherInfo.dart';
import 'package:flutter_app1/sharePreferences/sharePreference.dart';

class netWork extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '网络请求',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: NetWorkPage(context),
    );
  }

}

// ignore: must_be_immutable
class NetWorkPage extends StatefulWidget{
  BuildContext context;

  NetWorkPage(this.context);

  @override
  NetWorkState createState() {
    // TODO: implement createState
    return NetWorkState(context);
  }

}

class NetWorkState extends State<NetWorkPage>{
  BuildContext context;

  NetWorkState(this.context);
  sharePreference preference;
  String result;
  httpClient client = new httpClient();
  bool offstage = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(onPressed: (){
          Navigator.pop(this.context);
        },
        child: Text('返回'),
        color: Colors.transparent,),
        title: Text('网络请求'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text('$result'),
            RaisedButton(
              onPressed: (){
                getNetWorkData();
              },
              child: Text('点击请求网络数据'),
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  offstage=!offstage;
                });
                client.getWeaather('weatherApi', '双流').then((res){
                  setState(() {
                    offstage=!offstage;
                    new ChangePage().ToNextPage(this.context, new Weather(new WeatherInfo.formJson(res.data)));
                  });
                });
              },
              child: Text('天气预报'),
            ),
            Offstage(
              offstage: offstage,
              child: Text('加载中...',style: TextStyle(color: Colors.red),),
            ),
          ],
        ),
      ),
    );
  }

  void getNetWorkData() {
    /*client.logoIn('','18408249328','123456');
      client.updata('app/verUpdate/check/', 'SYN_HEALTH_CONSUMER');
      client.getUserInfo('users/', '76a7fdf7-8f62-4867-a3d7-aa11299fca63').then((res){
        print(res+',返回的回调结果');
        setState(() {
          result = res;
        });
      });*/
      client.getWeaather('weatherApi', '双流').then((res){
        setState(() {
//          Map weatherInfo = json.decode(res.body);
//          var weather = new Weather.fromJson(res.data);
          var weatherInfo = new WeatherInfo.formJson(res.data);
          print(weatherInfo.data.toString()+',返回的回调结果');
          result = weatherInfo.toString();
        });
      });
  }

  void initData() async{
    preference = await sharePreference.getInstance();
    setState(() {
      result = preference.getString('name');
      print('$result,preference的name');
    });
  }
}