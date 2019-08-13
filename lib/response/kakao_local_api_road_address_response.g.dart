// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_local_api_road_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoLocalApiRoadAddressResponse _$KakaoLocalApiRoadAddressResponseFromJson(
    Map<String, dynamic> json) {
  return KakaoLocalApiRoadAddressResponse(
      addressName: json['address_name'] as String,
      region1DepthName: json['region_1depth_name'] as String,
      region2DepthName: json['region_2depth_name'] as String,
      region3DepthName: json['region_3depth_name'] as String,
      roadName: json['road_name'] as String,
      undergroundYn: json['underground_yn'] as String,
      mainBuildingNo: json['main_building_no'] as String,
      subBuildingNo: json['sub_building_no'] as String,
      zoneNo: json['zone_no'] as String);
}

Map<String, dynamic> _$KakaoLocalApiRoadAddressResponseToJson(
        KakaoLocalApiRoadAddressResponse instance) =>
    <String, dynamic>{
      'address_name': instance.addressName,
      'region_1depth_name': instance.region1DepthName,
      'region_2depth_name': instance.region2DepthName,
      'region_3depth_name': instance.region3DepthName,
      'road_name': instance.roadName,
      'underground_yn': instance.undergroundYn,
      'main_building_no': instance.mainBuildingNo,
      'sub_building_no': instance.subBuildingNo,
      'zone_no': instance.zoneNo
    };
