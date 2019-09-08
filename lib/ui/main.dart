import 'dart:async';
import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misemeonjigadoeeo/components/webviews/kakao_address.dart';
import 'package:misemeonjigadoeeo/response/kakao_local_api_document_response.dart';
import 'package:misemeonjigadoeeo/ui/location_setting_page.dart';
import 'package:misemeonjigadoeeo/viewmodel/fine_dust_viewmodel.dart';
import 'package:misemeonjigadoeeo/viewmodel/user_location_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:misemeonjigadoeeo/firebase/firebase_admob_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => UserLocationViewModel(),
        ),
        ChangeNotifierProvider(
          builder: (context) => FineDustViewModel(),
        ),
      ],
      child: Platform.isAndroid
          ? MaterialApp(
              title: 'Flutter Demo',
              home: HomePage(),
            )
          : CupertinoApp(
              title: 'Flutter Demo',
              theme: CupertinoThemeData(
                  primaryColor: CupertinoColors.lightBackgroundGray),
              home: HomePage(),
            ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserLocationViewModel _userLocationViewModel;
  FineDustViewModel _fineDustViewModel;
  BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdmobManager.initializeAdmob();
    _bannerAd = FirebaseAdmobManager.getBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _userLocationViewModel = Provider.of(context, listen: false);
    _fineDustViewModel = Provider.of(context);
    FirebaseAdmobManager.showBannerAd(_bannerAd);

    return Platform.isAndroid
        ? Scaffold(
            drawer: Drawer(),
            appBar: AppBar(
              centerTitle: true,
              title: getTitleText(),
              actions: <Widget>[
                GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Icon(Icons.location_on),
                    ),
                    onTap: () {
                      route(context, LocationSettingPage());
                    })
              ],
            ),
            body: RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    returnWidget(context),
                  ],
                ),
                onRefresh: () {
                  return Future<void>.delayed(Duration(seconds: 1)).then((_) {
                    updateFineDustInfo();
                  });
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                updateFineDustInfo();
              },
              tooltip: 'Increment',
              child: Icon(Icons.refresh),
            ),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: getTitleText(),
              trailing: GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Icon(Icons.location_on),
                  ),
                  onTap: () {
                    route(context, LocationSettingPage());
                  }),
            ),
            child: SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  CupertinoSliverRefreshControl(
                    onRefresh: () {
                      return Future<void>.delayed(const Duration(seconds: 1))
                        ..then<void>((_) {
                          updateFineDustInfo();
                        });
                    },
                  ),
                  SliverFixedExtentList(
                    itemExtent: 100,
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return returnWidget(context);
                    }, childCount: 1),
                  )
                ],
              ),
            ),
          );
  }

  Widget loadingIndicator() {
    Widget _indicatorWidget;

    if (Platform.isAndroid) {
      _indicatorWidget = Center(
        child: CircularProgressIndicator(),
      );
    } else if (Platform.isIOS) {
      _indicatorWidget = Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return _indicatorWidget;
  }

  void updateFineDustInfo() {
    _userLocationViewModel.refreshPosition().then((_) {
      Future.wait([
        _userLocationViewModel.updateCurrentAddress(),
        _fineDustViewModel.getFineDustInfo(_userLocationViewModel.position)
      ]).then((_) {
        _fineDustViewModel.invokeNotifyListeners();
      });
    });
  }

  Widget showFineDustWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('현재 시간 - ${_fineDustViewModel.updatedDateTime.toString()}'),
          SizedBox(
            height: 10,
          ),
          Text(
              '미세먼지 정보 : ${_fineDustViewModel.fineDustResponse.iaqi.pm25.v.toString()}'),
          /*Text(locationPermission && userLocation != null
                    ? '현재 위치 - ${userLocation.latitude}, ${userLocation.longitude}'
                    : '위치 권한 없음'),
                SwitchListTile(
                    value: locationPermission,
                    onChanged: _permissionChange,
                    title: Text('위치 권한'))*/
          // 위도 - userLocation.latitude
          // 경도 - userLocation.longitude
          // 고도 - userLocation.altitude
          RaisedButton(
            child: Text('주소 검색'),
            onPressed: () {
              route(context, KakaoAddress());
            },
          )
        ],
      ),
    );
  }

  Widget getTitleText() {
    String _title;
    KakaoLocalApiDocumentResponse _kakaoLocalApiDocumentResponse;

    if (_userLocationViewModel.kakaoLocalApiResponse == null ||
        _userLocationViewModel.isLoading) {
      _title = "위치 갱신중";
    } else {
      if (_userLocationViewModel
              .kakaoLocalApiResponse.kakaoLocalApiDocumentsResponse.length ==
          0) {
        _title = "주소 확인 불가";
      } else {
        _kakaoLocalApiDocumentResponse = _userLocationViewModel
            .kakaoLocalApiResponse.kakaoLocalApiDocumentsResponse[0];

        if (_kakaoLocalApiDocumentResponse.kakaoLocalApiRoadAddressResponse ==
            null) {
          _title = _kakaoLocalApiDocumentResponse
              .kakaoLocalApiAddressResponse.addressName;
        } else {
          _title = _kakaoLocalApiDocumentResponse
              .kakaoLocalApiRoadAddressResponse.addressName;
        }
      }
    }

    return Text(_title);
  }

  Widget returnWidget(BuildContext context) {
    Widget returnWidget;

    if (_userLocationViewModel.isLoading == null &&
        _fineDustViewModel.isLoading == null) {
      updateFineDustInfo();
      returnWidget = loadingIndicator();
    } else if (_userLocationViewModel.isLoading ||
        _fineDustViewModel.isLoading) {
      returnWidget = loadingIndicator();
    } else {
      returnWidget = showFineDustWidget(context);
    }
    return returnWidget;
  }

  void route(BuildContext context, Widget page) {
    if (Platform.isAndroid) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    } else if (Platform.isIOS) {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
    }
  }
}
