import 'package:flutter/material.dart';
import 'package:flutter_app1/network/httpClient.dart';
import 'package:flutter_app1/network/weather/WeatherInfo.dart';

class Weather extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '天气预报',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: new WeatherPage(context),
    );
  }
}

class WeatherPage extends StatefulWidget{
  BuildContext context;

  WeatherPage(this.context);

  @override
  WeatherState createState() {
    // TODO: implement createState
    return WeatherState(context);
  }

}

class WeatherState extends State<WeatherPage>{
  BuildContext context;

  WeatherState(this.context);
  String title='天气预报';
  httpClient client = new httpClient();
  String city;//当前城市
  String nowTemperature='0℃';//当前温度
  String nowWeek='';//当前日期
  String highTem='0℃';//最高温度
  String lowTem='0℃';//最低温度
  String type="";
  var weatherInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherDate();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(onPressed: (){
          Navigator.pop(this.context);
        },
        child: Text('返回'),),
        title: Text('$title'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('$nowWeek'),
                Text('$type'),
                Text('当前$nowTemperature',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),),
                Text('$lowTem\/$highTem')
              ],
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const<int,TableColumnWidth>{
                0:FlexColumnWidth(50),
                1:FlexColumnWidth(50),
                2:FlexColumnWidth(100),
                3:FlexColumnWidth(50),
                4:FlexColumnWidth(50),
              },
              border: TableBorder.all(color: Colors.grey,width: 2.0,style: BorderStyle.solid),
              children: <TableRow>[
                TableRow( children : <Widget>[
                  Center(
                      child:Text('日期')
                  ),
                  Center(
                      child:Text('天气'),
                  ),
                  Center(
                    child:
                        new Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text('风向'),),
                  ),
                  Center(
                    child:
                    Text('最高温度'),
                  ),
                  Center(
                    child:
                    Text('最低温度'),
                  )
                ]
                ),
                TableRow( children : <Widget>[
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[1].date.substring(weatherInfo.data.forecast[1].date.indexOf('星'),weatherInfo.data.forecast[1].date.length)),
                  ),
                  Center(
                    child:
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child:Text(weatherInfo.data.forecast[1].type),),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[1].fengli),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[1].high.split(' ')[1]),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[1].low.split(' ')[1]),
                  )
                ]
                ),
                TableRow( children : <Widget>[
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[2].date.substring(weatherInfo.data.forecast[2].date.indexOf('星'),weatherInfo.data.forecast[2].date.length)),
                  ),
                  Center(
                    child:
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(weatherInfo.data.forecast[2].type),),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[2].fengli),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[2].high.split(' ')[1]),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[2].low.split(' ')[1]),
                  )
                ]
                ),
                TableRow( children : <Widget>[
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[3].date.substring(weatherInfo.data.forecast[3].date.indexOf('星'),weatherInfo.data.forecast[3].date.length)),
                  ),
                  Center(
                    child:
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(weatherInfo.data.forecast[3].type),),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[3].fengli),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[3].high.split(' ')[1]),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[3].low.split(' ')[1]),
                  )
                ]
                ),
                TableRow( children : <Widget>[
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[4].date.substring(weatherInfo.data.forecast[4].date.indexOf('星'),weatherInfo.data.forecast[4].date.length)),
                  ),
                  Center(
                    child:
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(weatherInfo.data.forecast[4].type),),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[4].fengli),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[4].high.split(' ')[1]),
                  ),
                  Center(
                    child:
                    Text(weatherInfo.data.forecast[4].low.split(' ')[1]),
                  )
                ]
                ),
              ],
            ),
        ],
      ),
    );
  }

  void getWeatherDate() {
    client.getWeaather('weatherApi', '双流').then((res){
      print(res.data.toString()+',返回的回调结果');
      setState(() {
        weatherInfo = new WeatherInfo.formJson(res.data);
        city = weatherInfo.data.city;
        title = city;
        nowTemperature = weatherInfo.data.wendu+'℃';
        nowWeek = weatherInfo.data.forecast[0].date.substring(weatherInfo.data.forecast[0].date.indexOf('星'),weatherInfo.data.forecast[0].date.length);
        highTem = weatherInfo.data.forecast[0].high.split(' ')[1];
        lowTem = weatherInfo.data.forecast[0].low.split(' ')[1];
        type = weatherInfo.data.forecast[0].type;
        print('$city当前城市');
      });
    });
  }

}