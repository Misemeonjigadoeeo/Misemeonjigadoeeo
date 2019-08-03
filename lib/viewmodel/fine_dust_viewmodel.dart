import 'package:geolocator/geolocator.dart';
import 'package:misemeonjigadoeeo/response/fine_dust_response.dart';
import 'package:misemeonjigadoeeo/service/fine_dust_service.dart';

import 'base_viewmodel.dart';

class FineDustViewModel extends BaseViewModel {

  FineDustService fineDustService = FineDustService();
  FineDustResponse fineDustResponse;
  DateTime updatedDateTime;

  Future<void> getFineDustInfo(Position pos) async {
    changeLoadingState();
    fineDustResponse = await fineDustService.getFineDustInfoByLatLng(pos);
    refreshDateTime();
    changeLoadingState();
  }

  refreshDateTime() {
    updatedDateTime = DateTime.now();
  }
}
