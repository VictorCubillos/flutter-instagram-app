import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/backend/repositories/photo_repostiory.dart';
import 'package:flutter_instagram_app/backend/repositories/post_repository.dart';
import 'package:flutter_instagram_app/backend/repositories/user_repository.dart';
import 'package:flutter_instagram_app/backend/services/postgresql/photo_postgresql_service.dart';
import 'package:flutter_instagram_app/backend/services/postgresql/post_postgresql_service.dart';
import 'package:flutter_instagram_app/backend/services/postgresql/users_postgresql_service.dart';

import 'frontend/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static final PostRepository postRepository = new PostPostgreSQLService();
  static final UserRepository userRepository = new UserPostgreSQLService();
  static final PhotoRepository photoRepository = new PhotoPostgreSQLService();

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
        primaryIconTheme: IconThemeData(
          color: brightness == Brightness.light ? Colors.black87 : Colors.white,
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
