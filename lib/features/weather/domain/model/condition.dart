import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition extends Equatable {
  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  final String text;
  final String icon;
  final int code;

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  @override
  List<Object?> get props => [text, icon, code];
}
