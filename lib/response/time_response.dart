import 'package:json_annotation/json_annotation.dart';

part 'time_response.g.dart';

@JsonSerializable()
class TimeResponse {
  String s;
  String tz;
  int v;

  TimeResponse({
    this.s,
    this.tz,
    this.v
  });

  factory TimeResponse.fromJson(Map<String, dynamic> json) => _$TimeResponseFromJson(json);
}