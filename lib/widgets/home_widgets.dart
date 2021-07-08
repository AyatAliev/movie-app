import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_with_retrofit/ui/home/home_bloc.dart';
import 'package:flutter_api_with_retrofit/ui/movie_info/movie_info.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import '../model/popular_entity.dart';

class MovieWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MovieWidgetState();
  }
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  void initState() {
    super.initState();
    homeBloc.moviePopular();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PopularEntity>(
      stream: homeBloc.subject.stream,
      builder: (context, AsyncSnapshot<PopularEntity> snapshot) {
        if (snapshot.hasData) {
          return _buildListView(context, snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CircularProgressIndicator()],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildListView(BuildContext context, PopularEntity movie) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading:
                Image.network(MOVIE_BASE_URL + movie.results[index].posterPath),
            title: Text(
              movie.results[index].title,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(movie.results[index].overview),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MovieInfo(movie.results[index].id)));
            },
          ),
        );
      },
      itemCount: movie.results.length,
    );
  }
}
