import 'package:json_annotation/json_annotation.dart';

import 'kakao_local_api_address_response.dart';
import 'kakao_local_api_road_address_response.dart';

part 'kakao_local_api_document_response.g.dart';

@JsonSerializable(explicitToJson: true)
class KakaoLocalApiDocumentResponse {
  @JsonKey(name: "road_address")
  final KakaoLocalApiRoadAddressResponse kakaoLocalApiRoadAddressResponse;
  @JsonKey(name: "address")
  final KakaoLocalApiAddressResponse kakaoLocalApiAddressResponse;

  KakaoLocalApiDocumentResponse({
    this.kakaoLocalApiRoadAddressResponse,
    this.kakaoLocalApiAddressResponse,
  });

  factory KakaoLocalApiDocumentResponse.fromJson(Map<String, dynamic> json) => _$KakaoLocalApiDocumentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$KakaoLocalApiDocumentResponseToJson(this);
}