import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/post_upper_barr.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    void _onRefresh() async {
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use refreshFailed()
      _refreshController.refreshCompleted();
    }

    // Cambio de modo light a modo dark
    void changeBrightness() {
      DynamicTheme.of(context).setBrightness(
          Theme.of(context).brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark);

      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.photo_camera),
          onPressed: null,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.light
                ? Icons.brightness_3
                : Icons.brightness_7),
            onPressed: changeBrightness,
          ),
        ],
        title: Text(
          "Instagram",
          style: TextStyle(fontFamily: 'Billabong', fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        header: MaterialClassicHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PostUpperBar(),
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.yellow,
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.purpleAccent,
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.redAccent,
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.teal,
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.green,
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.lightBlue,
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.lime,
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.orange,
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
