import 'package:flutter/material.dart';
import 'package:flutter_app1/second.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'first test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String selectValue='BJ';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Padding(padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: ClipOval(
              child: Image.asset('img/test.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,),
            ),),
            //横排
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                  Icon(Icons.add,
                    color: Color.fromARGB(0xff, 0xff, 0, 0),),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  //下拉选择框
                  DropdownButton(
                      items: _getItems(),
                      hint: Text('请选择城市'),
                      //下拉菜单选中的值（注意：在初始化时，要么为null，这时显示默认hint的值；
                      // 如果自己设定值，则值必须为列表中的一个值，如果不在列表中，会抛出异常）
                      value: selectValue,
                      onChanged: (itemValue){
                        setState(() {
                          print("itemValue=$itemValue");
                          selectValue = itemValue;
                        });
                      }),
                //图片按钮
                IconButton(
                  icon: new Image.asset('img/bg_logo.png'),
                  onPressed: IconButtonPressed,
                  tooltip: "long click",
                ),
              ],
            ),
            new Container(
              constraints: new BoxConstraints.expand(
                height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),
              decoration: new BoxDecoration(
                border: new Border.all(width: 2.0, color: Colors.red),
                color: Colors.grey,
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                image: new DecorationImage(
                  image: new NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
//                  image: new AssetImage('img/bg_logo.png'),
                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),//拉伸
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: new Text('Hello World',
                  style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
              transform: new Matrix4.rotationZ(0.3),
            )
//            new Image.asset('img/bg_logo.png'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',//长按提醒
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void IconButtonPressed(){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>new Second("second","My Name IS Second!")));
  }

  //返回城市列表，写法一
  List<DropdownMenuItem> _getItems() {
    List<DropdownMenuItem> items = new List();
    //value 表示DropdownButton.onChanged的返回值
    items.add(DropdownMenuItem(child: Text("北京"), value: "BJ"));
    items.add(DropdownMenuItem(child: Text("上海"), value: "SH"));
    items.add(DropdownMenuItem(child: Text("广州"), value: "GZ"));
    items.add(DropdownMenuItem(child: Text("深圳"), value: "SZ"));
    return items;
  }

}
