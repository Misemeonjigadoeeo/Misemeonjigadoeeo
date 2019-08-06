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
              theme: ThemeData.dark(),
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
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            body: Consumer<FineDustViewModel>(
              builder: (context, fineDust, child) {
                if (fineDust.isLoading == null || !fineDust.isLoading) {
                  updateFineDustInfo(context);
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return showFineDustWidget(context);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                updateFineDustInfo(context);
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
                          updateFineDustInfo(context);
                        });
                    },
                  ),
                  SliverFixedExtentList(
                    itemExtent: 100,
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Consumer<FineDustViewModel>(
                        builder: (context, fineDust, child) {
                          if (fineDust.isLoading == null || !fineDust.isLoading) {
                            updateFineDustInfo(context);
                            return Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                          return showFineDustWidget(context);
                        },
                      );
                    }, childCount: 1),
                  )
                ],
              ),
            ),
          );
  }

  void updateFineDustInfo(BuildContext context) {
    Provider.of<UserLocationViewModel>(context, listen: false)
        .refreshPosition()
        .then((_) {
      Provider.of<FineDustViewModel>(context).getFineDustInfo(
          Provider
              .of<UserLocationViewModel>(context, listen: false)
              .position);
    });
  }

  Widget showFineDustWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              '현재 시간 - ${Provider.of<FineDustViewModel>(context, listen: false).updatedDateTime.toString()}'),
          SizedBox(
            height: 10,
          ),
          Text(
              '미세먼지 정보 : ${Provider.of<FineDustViewModel>(context, listen: false).fineDustResponse.iaqi.pm25.v.toString()}'),
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
}
