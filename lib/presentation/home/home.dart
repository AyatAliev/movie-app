import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_with_retrofit/domain/bloc/home_bloc.dart';
import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';
import 'package:flutter_api_with_retrofit/presentation/movie_info/movie_info.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
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
            return _buildListView(context, snapshot.data);
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
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieInfo(movie.results[index].id)));
            },
          ),
        );
      },
      itemCount: movie.results.length,
    );
  }
}
