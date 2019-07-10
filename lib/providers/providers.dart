import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user_location_model.dart';
import 'fine_dust_model.dart';

class AppProvider extends ChangeNotifier with UserLocationModel, FineDustModel {}
