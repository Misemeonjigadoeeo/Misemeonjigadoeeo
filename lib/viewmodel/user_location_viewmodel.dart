import 'package:geolocator/geolocator.dart';
import 'package:misemeonjigadoeeo/models/user_location.dart';
import 'package:misemeonjigadoeeo/service/user_location_service.dart';

import 'base_viewmodel.dart';

mixin UserLocationViewModel on BaseViewModel {

  final UserLocationService userLocationService = UserLocationService();
  Position position;
  DateTime updatedDateTime;

  refreshPosition() async {
    isLoaded = false;
    position = await userLocationService.getLastKnownPosition();
    refreshTime();
    isLoaded = true;
    notifyListeners();
  }

  refreshTime() {
    updatedDateTime = DateTime.now();
  }
}
