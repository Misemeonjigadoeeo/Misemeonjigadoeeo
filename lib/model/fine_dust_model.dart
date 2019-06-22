import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:misemeonjigadoeeo/response/fine_dust_response.dart';
import 'package:misemeonjigadoeeo/service/fine_dust_service.dart';


mixin FineDustModel on Model {

  FineDustService _fineDustService = FineDustService();
  FineDustService get fineDustService => _fineDustService;
  FineDustResponse _fineDustResponse;
  FineDustResponse get fineDustResponse => _fineDustResponse;
  Position _position;
  Position get position => _position;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future getFineDustInfo(Position pos) async {
    _isLoaded = false;
    _fineDustResponse = await _fineDustService.getFineDustInfoByLatLng(pos);
    notifyListeners();
    _isLoaded = true;
  }

  static FineDustModel of(BuildContext context) => ScopedModel.of(context);
}