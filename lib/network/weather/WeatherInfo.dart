import 'package:flutter_app1/network/weather/WeatherData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'WeatherInfo.g.dart';

@JsonSerializable()
class WeatherInfo extends Object with _$WeatherInfoSerializerMixin{
  int code;
  String msg;
  WeatherData data;

  WeatherInfo(this.code, this.msg, this.data);

  @override
  String toString() {
    return 'WeatherIndo{code: $code, msg: $msg, data: $data}';
  }

  factory WeatherInfo.formJson(Map<String,dynamic> json) => _$WeatherInfoFromJson(json);

}