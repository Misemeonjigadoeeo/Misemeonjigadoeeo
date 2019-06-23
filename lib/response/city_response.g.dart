// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) {
  return CityResponse(
      geo: (json['geo'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
      name: json['name'] as String,
      url: json['url'] as String);
}

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'geo': instance.geo,
      'name': instance.name,
      'url': instance.url
    };
