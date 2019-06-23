import 'package:json_annotation/json_annotation.dart';

part 'attributions_response.g.dart';

@JsonSerializable()
class AttributionsResponse {
  String url;
  String name;

  AttributionsResponse({
    this.url,
    this.name
  });

  factory AttributionsResponse.fromJson(Map<String, dynamic> json) => _$AttributionsResponseFromJson(json);
}