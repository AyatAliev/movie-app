import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_with_retrofit/domain/bloc/home_bloc.dart';
import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';
import 'package:flutter_api_with_retrofit/presentation/movie_info/movie_info.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:flutter_api_with_retrofit/utils/utils.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeBloc>(builder: (context, _homeBloc, child) {
      return StreamBuilder<PopularEntity>(
        stream: _homeBloc.subject,
        builder: (context, AsyncSnapshot<PopularEntity> snapshot) {
          if (snapshot.hasData) {
            return _buildGridView(context, snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        },
      );
    });
  }

  Widget _buildLoadingWidget() {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator()],
      )),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occurred: $error"),
        ],
      )),
    );
  }

  Widget _buildGridView(BuildContext context, PopularEntity movie) {
    return Container(
      child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(movie.results.length, (index) {
            return Scaffold(
                backgroundColor: Color.fromARGB(100, 25, 45, 54),
                body: Align(
                    heightFactor: 200.0,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        child: InkResponse(
                          onTap: () {
                            _onTapHolder(movie.results[index]);
                          },
                          child: Column(children: [
                            _itemImage(movie.results[index]),
                            _itemTitle(movie.results[index]),
                            _itemDescription(movie.results[index])
                          ]),
                        ),
                      ),
                    )));
          })),
    );
  }

  _onTapHolder(PopularResults popularResults) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MovieInfo(popularResults.id)));
  }

  _itemImage(PopularResults popularResults) {
    Expanded(
        child: Card(
            margin: EdgeInsets.zero,
            child: Image.network("$MOVIE_BASE_URL${popularResults.posterPath}",
                fit: BoxFit.fitWidth, width: double.infinity)));
  }

  _itemTitle(PopularResults popularResults) {
    Align(
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
    Align(
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
