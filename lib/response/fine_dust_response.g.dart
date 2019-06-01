// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fine_dust_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FineDustResponse _$FineDustResponseFromJson(Map<String, dynamic> json) {
  return FineDustResponse(
      idx: json['idx'] as int,
      aqi: json['aqi'] as int,
      attributions: (json['attributions'] as List)
          ?.map((e) => e == null
              ? null
              : AttributionsResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      city: json['city'] == null
          ? null
          : CityResponse.fromJson(json['city'] as Map<String, dynamic>),
      dominentpol: json['dominentpol'] as String,
      iaqi: json['iaqi'] == null
          ? null
          : IaqiResponse.fromJson(json['iaqi'] as Map<String, dynamic>),
      time: json['time'] == null
          ? null
          : TimeResponse.fromJson(json['time'] as Map<String, dynamic>));
}

Map<String, dynamic> _$FineDustResponseToJson(FineDustResponse instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'aqi': instance.aqi,
      'attributions': instance.attributions,
      'city': instance.city,
      'dominentpol': instance.dominentpol,
      'iaqi': instance.iaqi,
      'time': instance.time
    };
