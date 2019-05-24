// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Yesterday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Yesterday _$YesterdayFromJson(Map<String, dynamic> json) {
  return new Yesterday(
      json['date'] as String,
      json['high'] as String,
      json['fx'] as String,
      json['low'] as String,
      json['fl'] as String,
      json['type'] as String);
}

abstract class _$YesterdaySerializerMixin {
  String get date;
  String get high;
  String get fx;
  String get low;
  String get fl;
  String get type;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date,
        'high': high,
        'fx': fx,
        'low': low,
        'fl': fl,
        'type': type
      };
}
