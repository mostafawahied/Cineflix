import 'package:cineflix/presentation/themes.dart';
import 'package:flutter/material.dart';
import 'Pages/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cinflix',
      theme: darkTheme,
      home: new SplashScreen(),
    );
  }
}
