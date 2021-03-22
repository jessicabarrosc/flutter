import 'package:flutter/material.dart';
import 'package:odonto_app/home.dart';
import 'package:odonto_app/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OdontoUniara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.purple,
          appBarTheme: AppBarTheme(elevation: 0),
          cursorColor: Colors.blue),
      home: HomePage(),
    );
  }
}
