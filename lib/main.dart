import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() => runApp(MyApp());

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

RefreshController _refreshController = RefreshController();

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  void _onRefresh(){

    /*.  after the data return,
          use _refreshController.refreshComplete() or refreshFailed() to end refreshing
    */
    _refreshController.refreshFailed();
  }

  void _onLoading(){
    /*
          use _refreshController.loadComplete() or loadNoData() to end loading
    */
    _refreshController.loadNoData();
  }

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
        color: Colors.blue,
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
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
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

  void dispose(){
    _refreshController.dispose();
    super.dispose();
  }
}
