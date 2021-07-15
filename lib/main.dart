import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api_with_retrofit/di.dart';
import 'package:flutter_api_with_retrofit/presentation/home/home.dart';

void main() {
  template();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.blue));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          title: 'Movie Popular',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home());
  }
}
