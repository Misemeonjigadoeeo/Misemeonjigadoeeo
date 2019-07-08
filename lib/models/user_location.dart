import 'package:geolocator/geolocator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserLocation {
  DateTime time = DateTime.now();
  Position position;

  UserLocation({this.time, this.position});

  refreshTime() {
    time = new DateTime.now();
  }

  refreshPosition() async {
    position = await Geolocator().getLastKnownPosition();
  }
}
