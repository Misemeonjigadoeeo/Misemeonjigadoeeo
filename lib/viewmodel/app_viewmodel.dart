import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user_location_viewmodel.dart';
import 'fine_dust_viewmodel.dart';

class AppViewModel extends ChangeNotifier with UserLocationViewModel, FineDustViewModel {}
