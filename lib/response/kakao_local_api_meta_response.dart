import 'package:json_annotation/json_annotation.dart';

part 'kakao_local_api_meta_response.g.dart';

@JsonSerializable()
class KakaoLocalApiMetaResponse {
  @JsonKey(name: "total_count")
  final int totalCount;

  KakaoLocalApiMetaResponse({
    this.totalCount
  });

  factory KakaoLocalApiMetaResponse.fromJson(Map<String, dynamic> json) => _$KakaoLocalApiMetaResponseFromJson(json);
  Map<String, dynamic> toJson() => _$KakaoLocalApiMetaResponseToJson(this);
}