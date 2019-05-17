import 'package:flutter/material.dart';
import 'package:flutter_app1/db/Note.dart';
import 'package:flutter_app1/db/dbHelper.dart';

class ChangeDb extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '数据库操作',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: ChangeDbView(context),
    );
  }

}

class ChangeDbView extends StatefulWidget{
  BuildContext context;

  ChangeDbView(this.context);

  @override
  ChangeDbState createState() {
    // TODO: implement createState
    return ChangeDbState(context);
  }

}

class ChangeDbState extends State<ChangeDbView>{
  BuildContext context;
  var db;
  String data='数据库数据';

  ChangeDbState(this.context);

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
        title: Text('数据库操作'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[
                RaisedButton(
                  child: Text('创建数据库'),
                  onPressed: (){
                    createNote();
                  },
                ),
                RaisedButton(
                  child: Text('获取数据库数据'),
                  onPressed: (){
                    db.getAllNotes().then((res){
                      setState(() {
                        if(res.length==0){
                          print('数据库暂无数据');
                          data = '数据库暂无数据';
                        }else {
                          res.forEach((note){
                            print(note);
                            data = data+note.toString();
                          });
                        }
                      });
                    });
                  },
                ),
                RaisedButton(
                  child: Text('删除数据库数据'),
                  onPressed: (){
                    db.deleteAll();
                  },
                ),
                RaisedButton(
                  child: Text('查询数据库数量'),
                  onPressed: (){
                    db.getCount().then((res){
                      setState(() {
                        print('$res,数据库数量');
                        data = '$res';
                      });
                    });
                  },
                ),
                RaisedButton(
                  child: Text('添加数据库数量'),
                  onPressed: (){
                    db.getCount().then((res){
                      db.saveNote(new Note(res+1, 2, 'ppppppp', 2, 2, 2, 2));
                    });
                  },
                ),
              ],
            ),
            Text('$data')
          ],
        ),
      ),
    );
  }

  void initData() async{
    db = new dbHelper();
  }

  void createNote() async{
    await db.saveNote(new Note(1,1,'dididi',1,1,10.0,13.0));
  }

}