import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

// models
import 'package:misemeonjigadoeeo/models/user_location.dart';
import 'package:misemeonjigadoeeo/models/fine_dust.dart';

// providers
import 'package:misemeonjigadoeeo/providers/providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => AppProvider(),
      child: Platform.isAndroid
          ? MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData.dark(),
              home: Consumer<AppProvider>(
                builder: (context, provider, child) => HomePage(
                    location: provider.device, fineDust: provider.fineDust),
              ))
          : CupertinoApp(
              title: 'Flutter Demo',
              theme: CupertinoThemeData(
                  primaryColor: CupertinoColors.lightBackgroundGray),
              home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  final UserLocation location;
  final FineDust fineDust;
  var apiCallCount = 0;

  HomePage({this.location, this.fineDust});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            body: getPosition(location, fineDust),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print(fineDust.isLoaded);
                Provider.of<AppProvider>(context, listen: false)
                    .refreshPosition(location);
                Provider.of<AppProvider>(context, listen: false)
                    .refreshTime(location);
                if (location.position != null) {
                  Provider.of<AppProvider>(context, listen: false)
                      .getFineDustInfo(fineDust, location.position);
                }
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
                    return Container(
                      child: location.position != null
                          ? getFineDust(location, fineDust)
                          : Center(child: CircularProgressIndicator()),
                    );
                  }, childCount: 1),
                )
              ],
            ),
          ));
  }

  Widget getPosition(UserLocation location, FineDust fineDust) {
    if (location.position != null) {
      return getFineDust(location, fineDust);
    }
    location.refreshPosition();

    return Center(child: CircularProgressIndicator());
  }

  Widget getFineDust(UserLocation location, FineDust fineDust) {
    Widget fineDustWidget;

    if (fineDust.fineDustResponse != null) {
      fineDustWidget = Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('현재 시간 - ${location.time}'),
          SizedBox(
            height: 10,
          ),
          Text('미세먼지 정보 : ${fineDust.fineDustResponse.iaqi.pm25.v.toString()}'),
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
    } else {
      fineDust.getFineDustInfo(location.position);
      fineDustWidget = Center(child: CircularProgressIndicator());
    }

    return fineDustWidget;
  }
}
