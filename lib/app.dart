import 'package:flurry/provider/todo.provider.dart';
import 'package:flurry/screen/home.dart';
import 'package:flurry/screen/login.dart';
import 'package:flurry/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoProvider())
        ],
        child: MaterialApp(
          home: SplashScreen(),
          theme: ThemeData(fontFamily: "NotoSans"),
          themeMode: ThemeMode.dark,
          routes: <String, WidgetBuilder>{
            '/home': (context) => Home(),
            '/login': (context) => Login(),
          },
        ));
  }
}
