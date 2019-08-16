// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_local_api_document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoLocalApiDocumentResponse _$KakaoLocalApiDocumentResponseFromJson(
    Map<String, dynamic> json) {
  return KakaoLocalApiDocumentResponse(
      kakaoLocalApiRoadAddressResponse: json['road_address'] == null
          ? null
          : KakaoLocalApiRoadAddressResponse.fromJson(
              json['road_address'] as Map<String, dynamic>),
      kakaoLocalApiAddressResponse: json['address'] == null
          ? null
          : KakaoLocalApiAddressResponse.fromJson(
              json['address'] as Map<String, dynamic>));
}

Map<String, dynamic> _$KakaoLocalApiDocumentResponseToJson(
        KakaoLocalApiDocumentResponse instance) =>
    <String, dynamic>{
      'road_address': instance.kakaoLocalApiRoadAddressResponse?.toJson(),
      'address': instance.kakaoLocalApiAddressResponse?.toJson()
    };
