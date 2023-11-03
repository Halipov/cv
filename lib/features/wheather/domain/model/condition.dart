import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condtition {
  final String text;
  final String icon;
  final int code;

  Condtition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condtition.fromJson(Map<String, dynamic> json) =>
      _$CondtitionFromJson(json);

  Map<String, dynamic> toJson() => _$CondtitionToJson(this);
}
