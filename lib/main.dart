import 'package:flutter/material.dart';
import 'package:flutter_api_with_retrofit/presentation/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          title: 'Movie Popular',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home());
  }
}
