import 'package:json_annotation/json_annotation.dart';

part 'value_response.g.dart';

@JsonSerializable()
class ValueResponse {
  double v;

  ValueResponse({
    this.v
  });

  factory ValueResponse.fromJson(Map<String, dynamic> json) => _$ValueResponseFromJson(json);

}