import 'package:json_annotation/json_annotation.dart';
import 'attributions_response.dart';
import 'city_response.dart';
import 'iaqi_response.dart';
import 'time_response.dart';

part 'fine_dust_response.g.dart';

@JsonSerializable()
class FineDustResponse {
  int idx;
  int aqi;
  List<AttributionsResponse> attributions;
  CityResponse city;
  String dominentpol;
  IaqiResponse iaqi;
  TimeResponse time;

  FineDustResponse({
    this.idx,
    this.aqi,
    this.attributions,
    this.city,
    this.dominentpol,
    this.iaqi,
    this.time
  });

  factory FineDustResponse.fromJson(Map<String, dynamic> json) => _$FineDustResponseFromJson(json);

}