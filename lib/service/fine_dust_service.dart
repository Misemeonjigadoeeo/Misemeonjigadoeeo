import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:misemeonjigadoeeo/response/fine_dust_response.dart';

class FineDustService {
  String baseUrl="https://api.waqi.info/feed/";

  Future<FineDustResponse> getFineDustInfoByLatLng(Position pos) async {
    String apiUrl = baseUrl + "geo:" + pos.latitude.toString() + ";" + pos.longitude.toString() + "/?token=" + "9be421958a0c7b7546c3a30bbda4d2e717d6bf22";
    final response = await http.get(apiUrl);

    if(response.statusCode == 200) {
      debugPrint("${jsonDecode(response.body)['data'].toString()}");
      return FineDustResponse.fromJson(jsonDecode(response.body)['data']);
    }
    else {
      return null;
    }
  }
}