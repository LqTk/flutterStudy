import 'package:flutter/material.dart';

class Second extends StatelessWidget{

  String title;
  String name;

  Second(this.title, this.name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '$title',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: SecondPage('$title','$name',context),
    );
  }
}

class SecondPage extends StatefulWidget {

  String title;
  String name;
  BuildContext context;

  SecondPage(this.title, this.name,this.context);

  @override
  SecondPageState createState() {
    // TODO: implement createState
    return SecondPageState(this.title, this.name,this.context);
  }
}

class SecondPageState extends State<SecondPage>{

  String title;
  String name;
  String showText = '显示';
  bool offstate = false;
  final BuildContext context;

  SecondPageState(this.title, this.name,this.context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('$title'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('$title'),
              Text('$name'),
              Offstage(
                key: Key("first"),
                offstage: offstate,
                child: Padding(padding: new EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.asset('img/test.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    ),
                  ),
                )
              ),
              RaisedButton(
                child: Text('点击切换$showText'),
                onPressed:(){
                  setState(() {
                    offstate = !offstate;
                    if (offstate) {
                      showText = '显示';
                    }else{
                      showText = '隐藏';
                    }
                  });
                },
              ),
              RaisedButton(
                  child: Text('返回'),
                  onPressed:(){
                    Navigator.pop(this.context);
                  }
              )
            ],
          ),
        )
    );
  }
}