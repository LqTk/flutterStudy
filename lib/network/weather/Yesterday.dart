import 'package:json_annotation/json_annotation.dart';
part 'Yesterday.g.dart';
@JsonSerializable()
class Yesterday extends Object with _$YesterdaySerializerMixin{
  String date;
  String high;
  String fx;
  String low;
  String fl;
  String type;

  Yesterday(this.date, this.high, this.fx, this.low, this.fl, this.type);

  @override
  String toString() {
    return 'yesterday{data: $date, high: $high, fx: $fx, low: $low, fl: $fl, type: $type}';
  }

  factory Yesterday.fromJson(Map<String,dynamic> json)=> _$YesterdayFromJson(json);

}