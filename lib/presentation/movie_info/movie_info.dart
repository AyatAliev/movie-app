import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_with_retrofit/domain/model/movie_info_entity.dart';
import 'package:flutter_api_with_retrofit/presentation/bloc/movie_info_bloc.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:flutter_api_with_retrofit/widget/rating_bar.dart';
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

  Widget _buildMovieInfo(
      BuildContext context, MovieInfoEntity movieInfoEntity) {
    return Scaffold(
      appBar: AppBar(title: Text(movieInfoEntity.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Image.network(
                  "$MOVIE_BASE_URL${movieInfoEntity.posterPath}",
                  fit: BoxFit.fitWidth),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(movieInfoEntity.title,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                RatingBar(
                  initialRating: movieInfoEntity.voteAverage / 2,
                  allowHalfRating: true,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                      full: Image.asset('images/ic_star_full.png'),
                      half: Image.asset('images/ic_star_half.png'),
                      empty: Image.asset('images/ic_star_empty.png')),
                  itemSize: 25,
                )
              ],
            ),
            Text(movieInfoEntity.releaseDate,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text(movieInfoEntity.overview,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text("Genres",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(_getGenres(movieInfoEntity.genres),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text("Run time",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("${movieInfoEntity.runtime.toString()} min",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }

  _getGenres(List<MovieInfoGenres> genres) {
    String allGenres = "";

    for (var i = 0; i < genres.length; i++) {
      if (i != genres.length - 1) {
        allGenres += "${genres[i].name} / ";
      } else {
        allGenres += genres[i].name;
      }
    }
    return allGenres;
  }
}
