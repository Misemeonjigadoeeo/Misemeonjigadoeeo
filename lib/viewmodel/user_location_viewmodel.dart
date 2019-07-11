import 'package:geolocator/geolocator.dart';
import 'package:misemeonjigadoeeo/service/user_location_service.dart';

import 'base_viewmodel.dart';

mixin UserLocationViewModel on BaseViewModel {

  final UserLocationService userLocationService = UserLocationService();
  Position position;

  refreshPosition() async {
    isLoaded = false;
    position = await userLocationService.getLastKnownPosition();
    isLoaded = true;
    notifyListeners();
  }
}
