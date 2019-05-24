import 'package:json_annotation/json_annotation.dart';

part 'EachDay.g.dart';

@JsonSerializable()
class EachDay extends Object with _$EachDaySerializerMixin{
  String date;
  String high;
  String low;
  String fengli;
  String fengxiang;
  String type;

  EachDay(this.date, this.high, this.low, this.fengli, this.fengxiang, this.type);

  @override
  String toString() {
    return 'eachDay{data: $date, high: $high, low: $low, fengli: $fengli, fengxiang: $fengxiang, type: $type}';
  }

  factory EachDay.fromJson(Map<String,dynamic> json) => _$EachDayFromJson(json);

}