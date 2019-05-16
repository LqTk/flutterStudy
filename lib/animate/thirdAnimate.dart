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

class ThirdState extends State<Third> with TickerProviderStateMixin {

  String title;
  BuildContext context;
  AnimationController controller;//动画控制器
  CurvedAnimation curved;//曲线动画，动画插值
  Animation<Offset> offset;
  bool forward = true;

  ThirdState(this.title,this.context);


  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(seconds: 3));
    curved = new CurvedAnimation(parent: controller, curve: Curves.linear);//模仿小球自由落体运动轨迹
//    controller.forward();//放在这里开启动画，打开页面就播放动画
  }

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
            //滑动动画
            new SlideTransition(position: new Tween<Offset>(
              //从左下角滑向右上角
              begin: const Offset(-1.0, -1.0),
              end: Offset(1.0,1.0),
            ).animate(curved),child: FlutterLogo(),),
            //旋转动画
            new RotationTransition(turns: curved,
              child: new FlutterLogo(size: 50.0,),),
            //大小出现动画
            new ScaleTransition(
              scale: curved,
              child: new Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 100,
                width: 100,
                child: FlutterLogo(size: 50.0,),
              ),
            ),
            //逐步出现动画
            new SizeTransition(
              sizeFactor: curved,
              child: Center(
                child: new Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: 100,
                  width: 100,
                  child: FlutterLogo(size: 200.0,),
                ),
              ),
            ),

          ],
        )

      ),
      floatingActionButton: new FloatingActionButton(onPressed: (){
        if(forward){
          controller.forward();//向前播放动画
        }else{
          controller.reverse();//向后播放动画
        }
        forward = !forward;
      },
      tooltip: '动画',
      child: new Icon(Icons.track_changes),),
    );
  }

}