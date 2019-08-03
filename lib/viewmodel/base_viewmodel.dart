import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {
  bool isLoaded;

  void changeLoadingState() {
    if(isLoaded == null) {
      isLoaded = false;
    }
    else {
      isLoaded = !isLoaded;
    }

    notifyListeners();
  }
}