import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:misemeonjigadoeeo/models/device.dart';

mixin DeviceModel on ChangeNotifier {
  final Device _device = Device();

  Device get device => _device;

  refreshFCMToken(Device device) {
    _device.refreshFCMToken();
    notifyListeners();
  }

  refreshTime(Device device) {
    _device.refreshTime();
    notifyListeners();
  }

  refreshPosition(Device device) {
    _device.refreshPosition();
    notifyListeners();
  }
}
