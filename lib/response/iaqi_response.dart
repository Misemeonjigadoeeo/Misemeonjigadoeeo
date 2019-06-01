import 'package:json_annotation/json_annotation.dart';
import 'value_response.dart';

part 'iaqi_response.g.dart';

@JsonSerializable()
class IaqiResponse {
  ValueResponse co;
  ValueResponse no2;
  ValueResponse o3;
  ValueResponse pm10;
  ValueResponse pm25;
  ValueResponse so2;
  ValueResponse wg;

  IaqiResponse({
    this.co,
    this.no2,
    this.o3,
    this.pm10,
    this.pm25,
    this.so2,
    this.wg
  });

  factory IaqiResponse.fromJson(Map<String, dynamic> json) => _$IaqiResponseFromJson(json);

}