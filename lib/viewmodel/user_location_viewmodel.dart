import 'package:misemeonjigadoeeo/models/user_location.dart';

import 'base_viewmodel.dart';

mixin UserLocationViewModel on BaseViewModel {
  final UserLocation _userLocation = UserLocation();

  UserLocation get device => _userLocation;

  refreshTime(UserLocation device) {
    _userLocation.refreshTime();
    notifyListeners();
  }

  refreshPosition(UserLocation device) {
    _userLocation.refreshPosition();
    notifyListeners();
  }
}
