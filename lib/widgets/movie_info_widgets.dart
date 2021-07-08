import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_with_retrofit/model/movie_info_entity.dart';
import 'package:flutter_api_with_retrofit/ui/movie_info/movie_info_bloc.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';

class MovieInfoWidget extends StatefulWidget {
  var id = 0;

  MovieInfoWidget(this.id);

  @override
  State<StatefulWidget> createState() {
    return _MovieInfoWidgetState(id);
  }
}

class _MovieInfoWidgetState extends State<MovieInfoWidget> {
  var id = 0;

  _MovieInfoWidgetState(this.id);

  @override
  void initState() {
    super.initState();
    movieInfoBloc.getInfoMovie(id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieInfoEntity>(
      stream: movieInfoBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieInfoEntity> snapshot) {
        if (snapshot.hasData) {
          return _buildMovieInfo(context, snapshot.data);
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
        Text("Error occurred: $error"),
      ],
    ));
  }

  Widget _buildMovieInfo(BuildContext context, MovieInfoEntity movie) {
    return Container(
        alignment: Alignment.topLeft,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
