import 'package:geolocator/geolocator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class Device {
  String fcm_token;
  DateTime time = DateTime.now();
  Position position;

  Device({this.fcm_token, this.time, this.position});

  refreshFCMToken() {
    _firebaseMessaging.getToken().then((token) {
      fcm_token = token;
    });
  }

  refreshTime() {
    time = new DateTime.now();
  }

  refreshPosition() async {
    position = await Geolocator().getLastKnownPosition();
  }
}
