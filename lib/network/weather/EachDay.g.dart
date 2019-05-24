// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EachDay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EachDay _$EachDayFromJson(Map<String, dynamic> json) {
  return new EachDay(
      json['date'] as String,
      json['high'] as String,
      json['low'] as String,
      json['fengli'] as String,
      json['fengxiang'] as String,
      json['type'] as String);
}

abstract class _$EachDaySerializerMixin {
  String get date;
  String get high;
  String get low;
  String get fengli;
  String get fengxiang;
  String get type;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date,
        'high': high,
        'low': low,
        'fengli': fengli,
        'fengxiang': fengxiang,
        'type': type
      };
}
