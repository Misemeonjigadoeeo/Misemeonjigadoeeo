import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misemeonjigadoeeo/model/app_model.dart';
import 'package:misemeonjigadoeeo/model/fine_dust_model.dart';
import 'package:misemeonjigadoeeo/model/pos_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: ScopedModel<AppModel>(model: AppModel(), child: HomePage()));
  }
}

class HomePage extends StatelessWidget {
  var apiCallCount = 0;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) =>
          Scaffold(
            body: getPosition(model),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                getPosition(model);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
    );
  }

  Widget getPosition(AppModel model) {
    if (model.position != null) {
      return getFineDust(model);
    }
    model.refreshPosition();

    return Center(child: CircularProgressIndicator());
  }

  Widget getFineDust(AppModel model) {
    Widget fineDustWidget;

    if (model.fineDustResponse != null) {
      fineDustWidget = Center(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text('현재 시간 - ${model.time}'),
                  Text('미세먼지 정보 : ${model.fineDustResponse.iaqi.pm25.v.toString()}'),
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
              )
            ],
          )
      );
    } else {
      model.getFineDustInfo(model.position);
      fineDustWidget = Center(child: CircularProgressIndicator());
    }

    return fineDustWidget;
  }
}

RefreshController _refreshController = RefreshController();

/*class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var currentTime = new DateTime.now();
//  var location = new Location();
//  LocationData userLocation;
//  bool locationPermission = false;

  void initState() {
    super.initState();
    _refreshController = RefreshController();
//    setLocation();
  }

  void _onRefresh() {
    */ /*.  after the data return,
          use _refreshController.refreshComplete() or refreshFailed() to end refreshing
    */ /*
    _refreshController.refreshFailed();
//    setLocation();
  }

  void _onLoading() {
    */ /*
          use _refreshController.loadComplete() or loadNoData() to end loading
    */ /*
    _refreshController.loadNoData();
  }

  */ /*void _permissionChange(bool value) {
    setState(() {
      locationPermission = value;
    });
    setLocation();
  }*/ /*

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      title: Text(widget.title),
    );
    return Scaffold(
      appBar: appbar,
      body: Container(
        child: SmartRefresher(
          enablePullDown: true,
          header: WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Text('현재 시간 - $currentTime'),
                  */ /*Text(locationPermission && userLocation != null
                      ? '현재 위치 - ${userLocation.latitude}, ${userLocation.longitude}'
                      : '위치 권한 없음'),
                  SwitchListTile(
                      value: locationPermission,
                      onChanged: _permissionChange,
                      title: Text('위치 권한'))*/ /*
                  // 위도 - userLocation.latitude
                  // 경도 - userLocation.longitude
                  // 고도 - userLocation.altitude
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  */ /*setLocation() async {
    await location.changeSettings(
        accuracy: LocationAccuracy.HIGH, interval: 1000);
    LocationData currentLocation;

    try {
      bool status = await location.serviceEnabled();
      bool permission = false;

      print('Service status: $status');
      if (status) {
        permission = await location.requestPermission();
        print('Permission: $permission');
        if (permission) {
          currentLocation = await location.getLocation();
        }
      } else {
        bool statusResult = await location.requestService();
        print('Service status activated after request: $statusResult');
        if (statusResult) {
          setLocation();
        }
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('asdf');
        currentLocation = null;
      }
    } catch (e) {
      debugPrint(e);
      currentLocation = null;
    }

    setState(() {
      userLocation = currentLocation;
      currentTime = new DateTime.now();
    });
  }*/ /*

  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}*/
