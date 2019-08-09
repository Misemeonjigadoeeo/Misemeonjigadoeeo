import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseViewModel with ChangeNotifier {
  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
  }
}