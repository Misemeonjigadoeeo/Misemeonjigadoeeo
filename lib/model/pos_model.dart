import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scoped_model/scoped_model.dart';


mixin PosModel on Model {
  var time = new DateTime.now();
  var counter = 0;
  Position position;

  counterIncrement() {
    counter += 1;
    notifyListeners();
  }

  counterDecrement() {
    counter -= 1;
    notifyListeners();
  }

  refreshTime() {
    time = new DateTime.now();
    notifyListeners();
  }

  refreshPosition() async {
    position = await Geolocator().getLastKnownPosition();

    if(position != null) {
      notifyListeners();
    }
  }
  static PosModel of(BuildContext context) =>
      ScopedModel.of<PosModel>(context);
}