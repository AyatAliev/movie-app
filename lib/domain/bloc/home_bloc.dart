import 'package:flutter_api_with_retrofit/data/repository/home_repository.dart';
import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  HomeBloc() {
    moviePopular();
  }

  final HomeRepository _repository = HomeRepository();
  final BehaviorSubject<PopularEntity> _subject =
      BehaviorSubject<PopularEntity>();
  BehaviorSubject<PopularEntity> get subject => _subject;

  final Map<String, String> queryParams = {
    "api_key": "412fa864f04063853cd4fce43d6c1c13"
  };

  moviePopular() async {
    var response = await _repository.moviePopular(queryParams);
    PopularEntity movies = PopularEntity().fromJson(response.data);
    _subject.sink.add(movies);
  }

  dispose() {
    _subject.close();
  }
}

