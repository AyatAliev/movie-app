
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_with_retrofit/widgets/home_widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieWidget(),
    );
  }
}