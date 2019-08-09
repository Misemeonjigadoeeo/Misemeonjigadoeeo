import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:misemeonjigadoeeo/viewmodel/fine_dust_viewmodel.dart';
import 'package:misemeonjigadoeeo/viewmodel/user_location_viewmodel.dart';

import 'package:provider/provider.dart';

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

class HomePage extends StatelessWidget {
  UserLocationViewModel _userLocationViewModel;
  FineDustViewModel _fineDustViewModel;
  @override
  Widget build(BuildContext context) {
    _userLocationViewModel = Provider.of(context, listen: false);
    _fineDustViewModel = Provider.of(context);

    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(),
            body: RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    returnWidget(),
                  ],
                ),
                onRefresh: () {
                  return Future<void>.delayed(Duration(seconds: 1)).then((_) {
                    updateFineDustInfo();
                  });
                }
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                updateFineDustInfo();
              },
              tooltip: 'Increment',
              child: Icon(Icons.refresh),
            ),
          )
        : CupertinoPageScaffold(
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
                      return returnWidget();
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
      _fineDustViewModel.getFineDustInfo(_userLocationViewModel.position);
    });
  }

  Widget showFineDustWidget() {
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
        ],
      ),
    );
  }

  Widget returnWidget() {
    Widget returnWidget;

    if (_userLocationViewModel.isLoading == null &&
        _fineDustViewModel.isLoading == null) {
      updateFineDustInfo();
      returnWidget = loadingIndicator();
    } else if (_userLocationViewModel.isLoading ||
        _fineDustViewModel.isLoading) {
      returnWidget = loadingIndicator();
    } else {
      returnWidget = showFineDustWidget();
    }
    return returnWidget;
  }
}
