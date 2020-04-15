import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Screens/Home.dart';
void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color(0xff8B78E6)),
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new Home(),
      title: new Text('Let\'s Get Fit',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
        color: Colors.purple
      ),),
      image: Image.asset('assets/logo1.png'),
      backgroundColor: Colors.white,
      photoSize: 160.0,
      loaderColor: Colors.purple,
    );

  }
}

