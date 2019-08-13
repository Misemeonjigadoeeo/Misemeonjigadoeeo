// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_local_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoLocalApiResponse _$KakaoLocalApiResponseFromJson(
    Map<String, dynamic> json) {
  return KakaoLocalApiResponse(
      kakaoLocalApiMetaResponse: json['kakaoLocalApiMetaResponse'] == null
          ? null
          : KakaoLocalApiMetaResponse.fromJson(
              json['kakaoLocalApiMetaResponse'] as Map<String, dynamic>),
      kakaoLocalApiDocumentsResponse:
          (json['kakaoLocalApiDocumentsResponse'] as List)
              ?.map((e) => e == null
                  ? null
                  : KakaoLocalApiDocumentResponse.fromJson(
                      e as Map<String, dynamic>))
              ?.toList());
}

Map<String, dynamic> _$KakaoLocalApiResponseToJson(
        KakaoLocalApiResponse instance) =>
    <String, dynamic>{
      'kakaoLocalApiMetaResponse': instance.kakaoLocalApiMetaResponse,
      'kakaoLocalApiDocumentsResponse': instance.kakaoLocalApiDocumentsResponse
    };
