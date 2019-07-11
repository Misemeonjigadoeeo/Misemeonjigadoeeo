import 'package:geolocator/geolocator.dart';
import 'package:misemeonjigadoeeo/models/fine_dust.dart';

import 'base_viewmodel.dart';

mixin FineDustViewModel on BaseViewModel {
  final FineDust _fineDust = FineDust();

  FineDust get fineDust => _fineDust;

  getFineDustInfo(FineDust fineDust, Position pos) {
    fineDust.getFineDustInfo(pos);
    notifyListeners();
  }
}
