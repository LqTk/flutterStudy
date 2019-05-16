import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app1/network/httpClient.dart';

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
  String result;
  httpClient client = new httpClient();

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
            )
          ],
        ),
      ),
    );
  }

  void getNetWorkData() {
      client.logoIn('','18408249328','123456');
      client.updata('app/verUpdate/check/', 'SYN_HEALTH_CONSUMER', 'Android');
      client.getUserInfo('users/', '76a7fdf7-8f62-4867-a3d7-aa11299fca63').then((res){
        print(res+',返回的回调结果');
        setState(() {
          result = res;
        });
      });
  }
}