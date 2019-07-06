import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:misemeonjigadoeeo/models/fine_dust.dart';

import 'package:misemeonjigadoeeo/response/fine_dust_response.dart';
import 'package:misemeonjigadoeeo/service/fine_dust_service.dart';

import 'package:geolocator/geolocator.dart';

mixin FineDustModel on ChangeNotifier {
  final FineDust _fineDust = FineDust();

  FineDust get fineDust => _fineDust;

  getFineDustInfo(FineDust fineDust, Position pos) {
    fineDust.getFineDustInfo(pos);
    notifyListeners();
  }
}
