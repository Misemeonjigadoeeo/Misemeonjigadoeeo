import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:misemeonjigadoeeo/secret/private_key.dart';

class FirebaseAdmobManager {
  static String get admobAppId {
    String _admobAppId;

    if(Platform.isAndroid) {
      _admobAppId = PrivateKey.androidAdmobAppId;
    }
    else if(Platform.isIOS) {
      _admobAppId = PrivateKey.iosAdmobId;
    }
    else _admobAppId = "";

    return _admobAppId;
  }

  static Future<bool> initializeAdmob({String trackingId, bool analyticsEnabled = false}) async {
    bool result = await FirebaseAdMob.instance.initialize(
        appId: null,
        trackingId: trackingId,
        analyticsEnabled: analyticsEnabled
    );

    return result;
  }
}