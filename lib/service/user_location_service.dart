import 'dart:async';

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
}