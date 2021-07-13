import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';
import 'package:flutter_api_with_retrofit/presentation/bloc/home_bloc.dart';
import 'package:flutter_api_with_retrofit/presentation/movie_info/movie_info.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:flutter_api_with_retrofit/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(),
      child: Consumer<HomeBloc>(builder: (context, _homeBloc, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color.fromARGB(100, 25, 45, 54),
            body: StreamBuilder<PopularEntity>(
              stream: _homeBloc.subjectMoviePopular.stream,
              builder: (context, AsyncSnapshot<PopularEntity> snapshot) {
                if (snapshot.hasData) {
                  return _buildGridView(context, snapshot.data);
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
      ),
    );
  }

  Widget _buildGridView(BuildContext context, PopularEntity movie) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(movie.results.length, (index) {
          return Align(
            heightFactor: 200.0,
            alignment: Alignment.center,
            child: Card(
              margin: EdgeInsets.all(16),
              child: InkResponse(
                onTap: () {
                  _onTapHolder(context, movie.results[index]);
                },
                child: Column(children: [
                  _itemImage(movie.results[index]),
                  _itemTitle(movie.results[index]),
                  _itemDescription(movie.results[index])
                ]),
              ),
            ),
          );
        }));
  }

  _onTapHolder(BuildContext context, PopularResults popularResults) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MovieInfo(popularResults.id)));
  }

  _itemImage(PopularResults popularResults) {
    return Expanded(
        child: Card(
            margin: EdgeInsets.zero,
            child: Image.network("$MOVIE_BASE_URL${popularResults.posterPath}",
                fit: BoxFit.fitWidth, width: double.infinity)));
  }

  _itemTitle(PopularResults popularResults) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 8, 0, 0),
        child: Text(popularResults.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }

  _itemDescription(PopularResults result) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 4, 0, 4),
        child: Text(Utils.parseDateToddMMyyyy(result.releaseDate),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
