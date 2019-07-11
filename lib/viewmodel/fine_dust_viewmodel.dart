import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:misemeonjigadoeeo/models/fine_dust.dart';

mixin FineDustViewModel on ChangeNotifier {
  final FineDust _fineDust = FineDust();

  FineDust get fineDust => _fineDust;

  getFineDustInfo(FineDust fineDust, Position pos) {
    fineDust.getFineDustInfo(pos);
    notifyListeners();
  }
}
