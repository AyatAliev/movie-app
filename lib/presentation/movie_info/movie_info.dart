import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_with_retrofit/domain/model/movie_info_entity.dart';
import 'package:flutter_api_with_retrofit/presentation/bloc/movie_info_bloc.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:provider/provider.dart';

class MovieInfo extends StatelessWidget {
  final movieId;

  MovieInfo(this.movieId);

  @override
  Widget build(BuildContext context) {
    return Provider<MovieInfoBloc>(
      create: (_) => MovieInfoBloc(movieId),
      dispose: (_, MovieInfoBloc movieInfoBloc) => movieInfoBloc.dispose(),
      child: Consumer<MovieInfoBloc>(builder: (context, _movieInfoBloc, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color.fromARGB(100, 25, 45, 54),
            body: StreamBuilder<MovieInfoEntity>(
              stream: _movieInfoBloc.subjectMovieInfo.stream,
              builder: (context, AsyncSnapshot<MovieInfoEntity> snapshot) {
                if (snapshot.hasData) {
                  return _buildMovieInfo(context, snapshot.data);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error);
                } else {
                  return _buildLoadingWidget();
                }
              },
            ),
          ),
        );
      }),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator()],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occurred: $error"),
      ],
    ));
  }

  Widget _buildMovieInfo(BuildContext context, MovieInfoEntity movie) {
    return Container(
        alignment: Alignment.topLeft,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 200,
                  height: 300,
                  child: Image.network(MOVIE_BASE_URL + movie.posterPath),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(16, 32, 16, 16)),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(8, 48, 0, 0),
                      child: Text(movie.title,
                          style: TextStyle(fontSize: 24, color: Colors.cyan)))),
            ]));
  }
}
