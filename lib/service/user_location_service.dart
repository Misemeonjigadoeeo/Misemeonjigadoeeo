import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misemeonjigadoeeo/response/kakao_local_api_response.dart';
import 'package:misemeonjigadoeeo/secret/private_key.dart';

import 'package:geolocator/geolocator.dart';

class UserLocationService {

  Future<Position> getLastKnownPosition() async {
    bool isLocationAvailable = await Geolocator().isLocationServiceEnabled();

    if(isLocationAvailable) {
      return Geolocator().getLastKnownPosition();
    }
    else {
      return null;
    }
  }

  Future<KakaoLocalApiResponse> getAddressFromPosition(Position position) async {
    String kakaoLocalApiBaseUrl = "https://dapi.kakao.com/v2/local/geo/coord2address.json?";
    final addressResponse = await http.get(
      kakaoLocalApiBaseUrl + "x=" + position.longitude.toString() + "&y=" + position.latitude.toString() + "&input_coord=WGS84",
      headers: {"Authorization": "KakaoAK ${PrivateKey.kakaoRestApiKey}"}
    );

    print(addressResponse.body);
    if(addressResponse.statusCode == 200) {
      return KakaoLocalApiResponse.fromJson(jsonDecode(addressResponse.body));
    }
    else {
      return null;
    }
  }
}