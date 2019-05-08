
import 'package:flutter/material.dart';

class Second extends StatelessWidget/*StatelessWidget*/{

  String title;
  String name;


  Second(this.title, this.name);

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
            RaisedButton(
                child: Text('返回'),
                onPressed:(){
                  Navigator.pop(context);
                }
            )
          ],
        ),
      )
    );
  }
}