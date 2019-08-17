import 'package:geolocator/geolocator.dart';
import 'package:misemeonjigadoeeo/response/fine_dust_response.dart';
import 'package:misemeonjigadoeeo/service/fine_dust_service.dart';

import 'base_viewmodel.dart';

class FineDustViewModel extends BaseViewModel {

  FineDustService fineDustService = FineDustService();
  FineDustResponse fineDustResponse;
  DateTime updatedDateTime;

  @override
  void invokeNotifyListeners() {
    notifyListeners();
  }

  Future<void> getFineDustInfo(Position pos) async {
    isLoading = true;
    fineDustResponse = await fineDustService.getFineDustInfoByLatLng(pos);
    refreshDateTime();
    isLoading = false;
  }

  refreshDateTime() {
    updatedDateTime = DateTime.now();
  }
}
