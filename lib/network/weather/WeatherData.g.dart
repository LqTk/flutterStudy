// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return new WeatherData(
      json['yesterday'] == null
          ? null
          : new Yesterday.fromJson(json['yesterday'] as Map<String, dynamic>),
      json['city'] as String,
      json['aqi'] as String,
      (json['forecast'] as List)
          ?.map((e) => e == null
              ? null
              : new EachDay.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['ganmao'] as String,
      json['wendu'] as String);
}

abstract class _$WeatherDataSerializerMixin {
  Yesterday get yesterday;
  String get city;
  String get aqi;
  List<EachDay> get forecast;
  String get ganmao;
  String get wendu;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'yesterday': yesterday,
        'city': city,
        'aqi': aqi,
        'forecast': forecast,
        'ganmao': ganmao,
        'wendu': wendu
      };
}
