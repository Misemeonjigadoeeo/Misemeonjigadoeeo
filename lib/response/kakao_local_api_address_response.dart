import 'package:json_annotation/json_annotation.dart';

part 'kakao_local_api_address_response.g.dart';

@JsonSerializable()
class KakaoLocalApiAddressResponse {
  @JsonKey(name: "address_name")
  final String addressName;
  @JsonKey(name: "region_1depth_name")
  final String region1DepthName;
  @JsonKey(name: "region_2depth_name")
  final String region2DepthName;
  @JsonKey(name: "region_3depth_name")
  final String region3DepthName;
  @JsonKey(name: "mountain_yn")
  final String mountainYn;
  @JsonKey(name: "main_address_no")
  final String mainAddressNo;
  @JsonKey(name: "sub_address_no")
  final String subAddressNo;
  @JsonKey(name: "zip_code")
  final String zipCode;

  KakaoLocalApiAddressResponse({
    this.addressName,
    this.region1DepthName,
    this.region2DepthName,
    this.region3DepthName,
    this.mountainYn,
    this.mainAddressNo,
    this.subAddressNo,
    this.zipCode
  });

  factory KakaoLocalApiAddressResponse.fromJson(Map<String, dynamic> json) => _$KakaoLocalApiAddressResponseFromJson(json);
  Map<String, dynamic> toJson() => _$KakaoLocalApiAddressResponseToJson(this);
}