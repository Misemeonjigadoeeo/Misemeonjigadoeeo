import 'package:geolocator/geolocator.dart';
import 'package:misemeonjigadoeeo/service/user_location_service.dart';
import 'package:misemeonjigadoeeo/response/kakao_local_api_response.dart';

import 'base_viewmodel.dart';

class UserLocationViewModel extends BaseViewModel {

  final UserLocationService userLocationService = UserLocationService();
  Position position;
  KakaoLocalApiResponse kakaoLocalApiResponse;

  @override
  void invokeNotifyListeners() {
    notifyListeners();
  }

  Future<void> refreshPosition() async {
    isLoading = true;
    position = await userLocationService.getLastKnownPosition();
    isLoading = false;
  }

  Future<void> updateCurrentAddress() async {
    isLoading = true;
    kakaoLocalApiResponse = await userLocationService.getAddressFromPosition(position);
    isLoading = false;
  }

}
