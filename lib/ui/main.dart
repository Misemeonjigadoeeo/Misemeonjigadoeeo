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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserLocationViewModel _userLocationViewModel;
  FineDustViewModel _fineDustViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _userLocationViewModel =
        Provider.of<UserLocationViewModel>(context, listen: false);
    _fineDustViewModel = Provider.of<FineDustViewModel>(context);

    updateFineDustInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            body: Consumer<FineDustViewModel>(
              builder: (context, fineDust, child) {
                if (fineDust.isLoaded == null || !fineDust.isLoaded) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return showFineDustWidget();
              },
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
                      return Consumer<FineDustViewModel>(
                        builder: (context, fineDust, child) {
                          if (fineDust.isLoaded == null || fineDust.isLoaded) {
                            return Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                          return showFineDustWidget();
                        },
                      );
                    }, childCount: 1),
                  )
                ],
              ),
            ),
          );
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
    ));
  }
}
