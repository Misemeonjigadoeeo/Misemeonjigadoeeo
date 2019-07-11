import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:misemeonjigadoeeo/viewmodel/app_viewmodel.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppViewModel>(
      builder: (context) => AppViewModel(),
      child: Platform.isAndroid
          ? MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData.dark(),
              home: Consumer<AppViewModel>(
                  builder: (context, viewmodel, child) =>
                      HomePage(appViewModel: viewmodel)))
          : CupertinoApp(
              title: 'Flutter Demo',
              theme: CupertinoThemeData(
                  primaryColor: CupertinoColors.lightBackgroundGray),
              home: Consumer<AppViewModel>(
                  builder: (context, viewmodel, child) =>
                      HomePage(appViewModel: viewmodel))),
    );
  }
}

class HomePage extends StatelessWidget {
  AppViewModel appViewModel;

  HomePage({this.appViewModel});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            body: appViewModel.position != null
                ? appViewModel.fineDustResponse != null
                    ? showFineDustWidget()
                    : showLoadingProgressBarAndFetchFineDust()
                : showLoadingProgressBarAndFetchPosition(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                /*print(fineDust.isLoaded);
          Provider.of<AppViewModel>(context, listen: false)
              .refreshPosition(location);
          Provider.of<AppViewModel>(context, listen: false)
              .refreshTime(location);
          if (location.position != null) {
            Provider.of<AppViewModel>(context, listen: false)
                .getFineDustInfo(fineDust, location.position);
          }*/
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
                        // provider.refreshPosition();
                        // provider.refreshTime();
                      });
                  },
                ),
                SliverFixedExtentList(
                  itemExtent: 100,
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Center(
                        child: Container(
                          child: appViewModel.position != null
                              ? appViewModel.fineDustResponse != null
                              ? showFineDustWidget()
                              : showLoadingProgressBarAndFetchFineDust()
                              : showLoadingProgressBarAndFetchPosition(),
                        )
                    );
                  }, childCount: 1),
                )
              ],
            ),
          ));
  }

  Widget showLoadingProgressBarAndFetchPosition() {
    appViewModel.refreshPosition();
    return Center(child: CircularProgressIndicator());
  }

  Widget showLoadingProgressBarAndFetchFineDust() {
    appViewModel.getFineDustInfo(appViewModel.position);
    return Center(child: CircularProgressIndicator());
  }

  Widget showFineDustWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('현재 시간 - ${appViewModel.updatedDateTime.toString()}'),
        SizedBox(
          height: 10,
        ),
        Text(
            '미세먼지 정보 : ${appViewModel.fineDustResponse.iaqi.pm25.v.toString()}'),
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
    ));
  }
}
