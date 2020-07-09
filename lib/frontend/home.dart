import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    void changeBrightness() {
      DynamicTheme.of(context).setBrightness(
          Theme.of(context).brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark);

      setState(() {});
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: changeBrightness,
        child: Icon(Theme.of(context).brightness == Brightness.light
            ? Icons.brightness_3
            : Icons.brightness_7),
      ),
      appBar: AppBar(
        title: Text(
          "Instagram",
        ),
        centerTitle: true,
      ),
    );
  }
}
