import 'package:flutter/material.dart';

class FiveTable extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '第五个Table',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: FiveView(context),
    );
  }
}

class FiveView extends StatefulWidget{
  BuildContext context;

  FiveView(this.context);

  @override
  FiveState createState() {
    // TODO: implement createState
    return FiveState(context);
  }
}

class FiveState extends State<StatefulWidget>{
  BuildContext context;

  FiveState(this.context);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          color: Colors.orange,
            child: Icon(Icons.keyboard_arrow_left),
            onPressed: (){
          Navigator.pop(this.context);
        }),
        title: Text('Table'),
        centerTitle: true,
      ),
      body: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const<int, TableColumnWidth>{
            0:FlexColumnWidth(50.0),
            1:FlexColumnWidth(100.0),
            2:FlexColumnWidth(50.0),
            3:FlexColumnWidth(120.0),
          },
          border: TableBorder.all(color: Colors.green,width: 2.0,style: BorderStyle.solid),
          children: <TableRow>[
            TableRow(children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('A11'),
                    Text('A12'),
                    Text('A13'),
                  ],
                ),
              ),
              Text('A2'),
              Text('A3'),
              ClipOval(
                child: Image.asset('img/test.jpg',fit: BoxFit.fitHeight,),
              ),
            ]),
            TableRow(children: <Widget>[
              Text('B1'),
              Center(
                child: Text('B2'),
              ),
              new Padding(padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),child: Text('B3'),),
              Text('B4'),
            ]),
            TableRow(children: <Widget>[
              Text('C1'),
              Text('C2'),
              Text('C3'),
              Text('C4'),
            ]),
            TableRow(children: <Widget>[
              Text('D1'),
              Text('D2'),
              Text('D3'),
              Text('D4'),
            ]),
          ],
        ),
      ),
    );
  }

}