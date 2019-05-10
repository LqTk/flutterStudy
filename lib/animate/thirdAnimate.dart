import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThirdAnimate extends StatelessWidget{
  String title;

  ThirdAnimate(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '$title',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: Third('$title',context),
    );
  }
}

class Third extends StatefulWidget{
  String title;
  BuildContext context;

  Third(this.title,this.context);

  @override
  ThirdState createState() {
    // TODO: implement createState
    return ThirdState(title,context);
  }

}

class ThirdState extends State<Third>{

  String title;
  BuildContext context;

  ThirdState(this.title,this.context);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          leading: new RaisedButton(
            color: Colors.red,
              child: Icon(Icons.keyboard_arrow_left),
              onPressed: (){Navigator.pop(this.context);}),
          title: Text('$title'),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
                icon: Image.asset('img/test.jpg'),
                onPressed: (){
                  Fluttertoast.showToast(
                    msg: '我是APPBar的第一个点击事件$title',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER);
                }),
            new IconButton(
                icon: Image.asset('img/bg_logo.png'),
                onPressed: (){
                  Fluttertoast.showToast(
                      msg: '我是APPBar的第二个点击事件$title',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER);
                }),
          ],
        ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform(
              transform: Matrix4.rotationZ(0.5),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: new EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Text('绕Z轴旋转'),
                  )
                ],
              )
            ),
            Transform(
              transform: Matrix4.rotationX(1),
              child: Text('绕X轴旋转'),
            ),
            Transform(
              transform: Matrix4.rotationY(1),
              child: Text('绕Y轴旋转'),
            ),
          ],
        )

      ),
    );
  }

}