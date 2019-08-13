import 'package:json_annotation/json_annotation.dart';

part 'kakao_local_api_road_address_response.g.dart';

@JsonSerializable()
class KakaoLocalApiRoadAddressResponse {
  @JsonKey(name: "address_name")
  final String addressName;
  @JsonKey(name: "region_1depth_name")
  final String region1DepthName;
  @JsonKey(name: "region_2depth_name")
  final String region2DepthName;
  @JsonKey(name: "region_3depth_name")
  final String region3DepthName;
  @JsonKey(name: "road_name")
  final String roadName;
  @JsonKey(name: "underground_yn")
  final String undergroundYn;
  @JsonKey(name: "main_building_no")
  final String mainBuildingNo;
  @JsonKey(name: "sub_building_no")
  final String subBuildingNo;
  @JsonKey(name: "zone_no")
  final String zoneNo;

  KakaoLocalApiRoadAddressResponse({
    this.addressName,
    this.region1DepthName,
    this.region2DepthName,
    this.region3DepthName,
    this.roadName,
    this.undergroundYn,
    this.mainBuildingNo,
    this.subBuildingNo,
    this.zoneNo
  });

  factory KakaoLocalApiRoadAddressResponse.fromJson(Map<String, dynamic> json) => _$KakaoLocalApiRoadAddressResponseFromJson(json);
  Map<String, dynamic> toJson() => _$KakaoLocalApiRoadAddressResponseToJson(this);
}