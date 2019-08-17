// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_local_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoLocalApiResponse _$KakaoLocalApiResponseFromJson(
    Map<String, dynamic> json) {
  return KakaoLocalApiResponse(
      kakaoLocalApiMetaResponse: json['meta'] == null
          ? null
          : KakaoLocalApiMetaResponse.fromJson(
              json['meta'] as Map<String, dynamic>),
      kakaoLocalApiDocumentsResponse: (json['documents'] as List)
          ?.map((e) => e == null
              ? null
              : KakaoLocalApiDocumentResponse.fromJson(
                  e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$KakaoLocalApiResponseToJson(
        KakaoLocalApiResponse instance) =>
    <String, dynamic>{
      'meta': instance.kakaoLocalApiMetaResponse?.toJson(),
      'documents': instance.kakaoLocalApiDocumentsResponse
          ?.map((e) => e?.toJson())
          ?.toList()
    };
