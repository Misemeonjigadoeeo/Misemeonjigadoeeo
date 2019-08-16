import 'package:json_annotation/json_annotation.dart';

import 'kakao_local_api_document_response.dart';
import 'kakao_local_api_meta_response.dart';

part 'kakao_local_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class KakaoLocalApiResponse {
  @JsonKey(name: "meta")
  final KakaoLocalApiMetaResponse kakaoLocalApiMetaResponse;
  @JsonKey(name: "documents")
  final List<KakaoLocalApiDocumentResponse> kakaoLocalApiDocumentsResponse;

  KakaoLocalApiResponse({
    this.kakaoLocalApiMetaResponse,
    this.kakaoLocalApiDocumentsResponse
  });

  factory KakaoLocalApiResponse.fromJson(Map<String, dynamic> json) => _$KakaoLocalApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$KakaoLocalApiResponseToJson(this);
}