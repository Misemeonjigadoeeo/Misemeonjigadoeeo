import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  var model = MainModel();
  runApp(ScopedModel<MainModel>(model: model, child: MyApp()));
}

class MainModel extends Model {
  var time = new DateTime.now();
  var counter = 0;

  counterIncrement() {
    counter += 1;
    notifyListeners();
  }

  counterDecrement() {
    counter -= 1;
    notifyListeners();
  }

  refreshTime() {
    time = new DateTime.now();
    notifyListeners();
  }

  static MainModel of(BuildContext context) =>
      ScopedModel.of<MainModel>(context);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Misemeonjigadoeeo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScopedModelDescendant<MainModel>(
          builder: (context, child, model) =>
          ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    model.counter.toString(),
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Text('현재 시간 - ${model.time}'),
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
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MainModel.of(context).counterIncrement();
          MainModel.of(context).refreshTime();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
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
    *//*.  after the data return,
          use _refreshController.refreshComplete() or refreshFailed() to end refreshing
    *//*
    _refreshController.refreshFailed();
//    setLocation();
  }

  void _onLoading() {
    *//*
          use _refreshController.loadComplete() or loadNoData() to end loading
    *//*
    _refreshController.loadNoData();
  }

  *//*void _permissionChange(bool value) {
    setState(() {
      locationPermission = value;
    });
    setLocation();
  }*//*

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
                  *//*Text(locationPermission && userLocation != null
                      ? '현재 위치 - ${userLocation.latitude}, ${userLocation.longitude}'
                      : '위치 권한 없음'),
                  SwitchListTile(
                      value: locationPermission,
                      onChanged: _permissionChange,
                      title: Text('위치 권한'))*//*
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

  *//*setLocation() async {
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
  }*//*

  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}*/
