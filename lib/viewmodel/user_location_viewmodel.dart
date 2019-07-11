import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misemeonjigadoeeo/models/user_location.dart';

mixin UserLocationViewModel on ChangeNotifier {
  final UserLocation _userLocation = UserLocation();

  UserLocation get device => _userLocation;

  refreshTime(UserLocation device) {
    _userLocation.refreshTime();
    notifyListeners();
  }

  refreshPosition(UserLocation device) {
    _userLocation.refreshPosition();
    notifyListeners();
  }
}
