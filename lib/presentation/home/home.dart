import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';
import 'package:flutter_api_with_retrofit/presentation/bloc/home_bloc.dart';
import 'package:flutter_api_with_retrofit/presentation/movie_info/movie_info.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map<String, String> queryParams = {
    "api_key": "412fa864f04063853cd4fce43d6c1c13"
  };

  final List<PopularResults> _popularEntity = [];
  ScrollController _scrollController;

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        print(queryParams);
        // Provider.of<HomeBloc>(context).moviePopular();
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<HomeBloc>(
      create: (_) => HomeBloc(GetIt.instance()),
      dispose: (_, HomeBloc homeBloc) => homeBloc.dispose(),
      child: Consumer<HomeBloc>(builder: (context, _homeBloc, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(title: Text('Popular Movie')),
            backgroundColor: Colors.grey,
            body: StreamBuilder<PopularEntity>(
              stream: _homeBloc.subjectMoviePopular.stream,
              builder: (context, AsyncSnapshot<PopularEntity> snapshot) {
                if (snapshot.hasData) {
                  _popularEntity.addAll(snapshot.data.results);
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
    return ListView.builder(
        controller: _scrollController,
        itemCount: _popularEntity.length,
        itemBuilder: (context, position) {
          return Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
            color: Colors.white,
            child: InkResponse(
              onTap: () {
                _onTapHolder(context, _popularEntity[position]);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  _item(_popularEntity[position]),
                ]),
              ),
            ),
          );
        });
  }

  _onTapHolder(BuildContext context, PopularResults popularResults) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MovieInfo(popularResults.id)));
  }

  _item(PopularResults popularResults) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: [
        Container(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network("$MOVIE_BASE_URL${popularResults.posterPath}",
                  fit: BoxFit.fitWidth, width: 160),
              Text(popularResults.releaseDate,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(popularResults.voteCount.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(popularResults.voteAverage.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
        Flexible(
            child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  title: Text(popularResults.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  subtitle: Text(popularResults.overview,
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey)),
                ))),
      ],
    );
  }
}
