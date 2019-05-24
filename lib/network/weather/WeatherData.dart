import 'package:flutter_app1/network/weather/EachDay.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app1/network/weather/Yesterday.dart';
part 'WeatherData.g.dart';
@JsonSerializable()
class WeatherData extends Object with _$WeatherDataSerializerMixin{
  Yesterday yesterday;
  String city;
  String aqi;
  List<EachDay> forecast;
  String ganmao;
  String wendu;

  WeatherData(this.yesterday, this.city, this.aqi, this.forecast, this.ganmao,
      this.wendu);

  @override
  String toString() {
    return 'WeatherData{yesterday: $yesterday, city: $city, aqi: $aqi, forecast: $forecast, ganmao: $ganmao, wendu: $wendu}';
  }

  factory WeatherData.fromJson(Map<String,dynamic> json) => _$WeatherDataFromJson(json);

}