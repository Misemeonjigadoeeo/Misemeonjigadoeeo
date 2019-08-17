import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseViewModel with ChangeNotifier {
  bool isLoading;

  void invokeNotifyListeners();
}