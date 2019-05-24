// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return new WeatherInfo(
      json['code'] as int,
      json['msg'] as String,
      json['data'] == null
          ? null
          : new WeatherData.fromJson(json['data'] as Map<String, dynamic>));
}

abstract class _$WeatherInfoSerializerMixin {
  int get code;
  String get msg;
  WeatherData get data;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'code': code, 'msg': msg, 'data': data};
}
