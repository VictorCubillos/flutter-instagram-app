import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/frontend/home.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter_instagram_app/frontend/common_variables.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,        
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          brightness: brightness,
          color: brightness == Brightness.light ? Colors.white : Colors.black12,
        ),
        primaryTextTheme: TextTheme(          
          headline6: TextStyle(
            color: brightness == Brightness.light ? Colors.black87 : Colors.white,
          ),
        ),
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: "Flutter Instagram App",
          theme: theme,
          home: Home(),
        );
      },
    );
  }
}
