// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iaqi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IaqiResponse _$IaqiResponseFromJson(Map<String, dynamic> json) {
  return IaqiResponse(
      co: json['co'] == null
          ? null
          : ValueResponse.fromJson(json['co'] as Map<String, dynamic>),
      no2: json['no2'] == null
          ? null
          : ValueResponse.fromJson(json['no2'] as Map<String, dynamic>),
      o3: json['o3'] == null
          ? null
          : ValueResponse.fromJson(json['o3'] as Map<String, dynamic>),
      pm10: json['pm10'] == null
          ? null
          : ValueResponse.fromJson(json['pm10'] as Map<String, dynamic>),
      pm25: json['pm25'] == null
          ? null
          : ValueResponse.fromJson(json['pm25'] as Map<String, dynamic>),
      so2: json['so2'] == null
          ? null
          : ValueResponse.fromJson(json['so2'] as Map<String, dynamic>),
      wg: json['wg'] == null
          ? null
          : ValueResponse.fromJson(json['wg'] as Map<String, dynamic>));
}

Map<String, dynamic> _$IaqiResponseToJson(IaqiResponse instance) =>
    <String, dynamic>{
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'pm10': instance.pm10,
      'pm25': instance.pm25,
      'so2': instance.so2,
      'wg': instance.wg
    };
