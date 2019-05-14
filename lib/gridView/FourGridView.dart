import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FourGridView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'GridView测试',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FourView(context),
    );
  }
}

// ignore: must_be_immutable
class FourView extends StatefulWidget{
  BuildContext context;

  FourView(this.context);

  @override
  FourViewState createState() {
    // TODO: implement createState
    return FourViewState(context);
  }

}

class FourViewState extends State<StatefulWidget>{
  BuildContext context;

  FourViewState(this.context);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        leading: RaisedButton(color: Colors.green, child: Text('返回'),onPressed: (){
          Navigator.pop(this.context);
        }),
        title: Text('GridView测试'),
        centerTitle: true,
      ),
      body: Center(
        child: new GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(10.0),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Center(
              child: Text('第一个'),
            ),
            Icon(Icons.access_alarm),
            RaisedButton(
              child: Text('第三个'),
              onPressed:(){
                Fluttertoast.showToast(msg: 'GirdView第三个控件',toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER);
            },),
            ClipOval(
              child: Image.asset('img/test.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,),
            ),
          ],
        ),
      ),
    );
  }

}