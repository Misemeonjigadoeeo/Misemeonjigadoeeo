import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:misemeonjigadoeeo/secret/private_key.dart';

//Singleton Class
class FirebaseAdmobManager {
  const FirebaseAdmobManager._();

  static String get admobAppId {
    String _admobAppId;

    if (Platform.isAndroid) {
      _admobAppId = PrivateKey.androidAdmobAppId;
    } else if (Platform.isIOS) {
      _admobAppId = PrivateKey.iosAdmobId;
    } else
      _admobAppId = "";

    return _admobAppId;
  }

  static String get bannerAdUnitId {
    String _bannerAdUnitId;

    if (kReleaseMode) {
      if (Platform.isAndroid) {
        _bannerAdUnitId = PrivateKey.androidAdmobBannerUnitId;
      } else if (Platform.isIOS) {
        _bannerAdUnitId = PrivateKey.iosAdmobBannerUnitId;
      } else {
        _bannerAdUnitId = "";
      }
    } else {
      _bannerAdUnitId = BannerAd.testAdUnitId;
    }

    return _bannerAdUnitId;
  }

  static Future<bool> initializeAdmob({String trackingId, bool analyticsEnabled = false}) async {
    bool result = await FirebaseAdMob.instance.initialize(
        appId: admobAppId,
        trackingId: trackingId,
        analyticsEnabled: analyticsEnabled);

    return result;
  }

  static BannerAd getBannerAd({
    AdSize size = AdSize.smartBanner,
    MobileAdTargetingInfo targetingInfo,
    MobileAdListener listener,
  }) {
    return BannerAd(
        adUnitId: bannerAdUnitId,
        size: size,
        targetingInfo: targetingInfo,
        listener: listener);
  }

  static Future<bool> showBannerAd(BannerAd bannerAd) async {
    bool result;
    bannerAd
      ..load()
      ..show().then((isSuccess) {
        result = isSuccess;
      }).catchError((e) {
        result = false;
      });

    return result;
  }
}
