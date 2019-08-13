// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_local_api_document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoLocalApiDocumentResponse _$KakaoLocalApiDocumentResponseFromJson(
    Map<String, dynamic> json) {
  return KakaoLocalApiDocumentResponse(
      kakaoLocalApiRoadAddressResponse:
          json['kakaoLocalApiRoadAddressResponse'] == null
              ? null
              : KakaoLocalApiRoadAddressResponse.fromJson(
                  json['kakaoLocalApiRoadAddressResponse']
                      as Map<String, dynamic>),
      kakaoLocalApiAddressResponse: json['kakaoLocalApiAddressResponse'] == null
          ? null
          : KakaoLocalApiAddressResponse.fromJson(
              json['kakaoLocalApiAddressResponse'] as Map<String, dynamic>));
}

Map<String, dynamic> _$KakaoLocalApiDocumentResponseToJson(
        KakaoLocalApiDocumentResponse instance) =>
    <String, dynamic>{
      'kakaoLocalApiRoadAddressResponse':
          instance.kakaoLocalApiRoadAddressResponse?.toJson(),
      'kakaoLocalApiAddressResponse':
          instance.kakaoLocalApiAddressResponse?.toJson()
    };
