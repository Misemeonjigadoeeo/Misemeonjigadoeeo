import 'package:geolocator/geolocator.dart';
import 'package:misemeonjigadoeeo/response/fine_dust_response.dart';
import 'package:misemeonjigadoeeo/service/fine_dust_service.dart';

FineDustService fineDustService = FineDustService();

class FineDust {
  bool isLoaded;
  FineDustResponse fineDustResponse;

  FineDust({this.isLoaded = false, this.fineDustResponse});

  getFineDustInfo(Position pos) async {
    isLoaded = false;
    fineDustResponse = await fineDustService.getFineDustInfoByLatLng(pos);
    isLoaded = true;
  }
}
