// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_local_api_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoLocalApiAddressResponse _$KakaoLocalApiAddressResponseFromJson(
    Map<String, dynamic> json) {
  return KakaoLocalApiAddressResponse(
      addressName: json['address_name'] as String,
      region1DepthName: json['region_1depth_name'] as String,
      region2DepthName: json['region_2depth_name'] as String,
      region3DepthName: json['region_3depth_name'] as String,
      mountainYn: json['mountain_yn'] as String,
      mainAddressNo: json['main_address_no'] as String,
      subAddressNo: json['sub_address_no'] as String,
      zipCode: json['zip_code'] as String);
}

Map<String, dynamic> _$KakaoLocalApiAddressResponseToJson(
        KakaoLocalApiAddressResponse instance) =>
    <String, dynamic>{
      'address_name': instance.addressName,
      'region_1depth_name': instance.region1DepthName,
      'region_2depth_name': instance.region2DepthName,
      'region_3depth_name': instance.region3DepthName,
      'mountain_yn': instance.mountainYn,
      'main_address_no': instance.mainAddressNo,
      'sub_address_no': instance.subAddressNo,
      'zip_code': instance.zipCode
    };
