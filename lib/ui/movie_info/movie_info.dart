import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_with_retrofit/widgets/movie_info_widgets.dart';

class MovieInfo extends StatelessWidget {

  var id = 0;
  MovieInfo(this.id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieInfoWidget(id),
    );
  }
}