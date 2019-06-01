import 'package:json_annotation/json_annotation.dart';

part 'city_response.g.dart';

@JsonSerializable()
class CityResponse {
  List<double> geo;
  String name;
  String url;

  CityResponse({
    this.geo,
    this.name,
    this.url
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) => _$CityResponseFromJson(json);

}