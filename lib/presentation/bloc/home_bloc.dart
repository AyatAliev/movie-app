import 'dart:async';

import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';
import 'package:flutter_api_with_retrofit/domain/usecase/movie_use_case.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  HomeBloc(this._movieUseCase) {
    moviePopular();
  }

  int page = 0;
  final MovieUseCase _movieUseCase;

  final Map<String,String> queryParams = {
    "api_key":"412fa864f04063853cd4fce43d6c1c13"
  };


  BehaviorSubject<PopularEntity> get subjectMoviePopular => _subjectMoviePopular;
  final BehaviorSubject<PopularEntity> _subjectMoviePopular = BehaviorSubject<PopularEntity>();

  moviePopular() async {
    page++;
    queryParams["page"] = page.toString();
    var response = await _movieUseCase.moviePopular(queryParams);
    response.fold((l) => print(l) , (r) => setData(r.data));

  }

  dispose() {
    _subjectMoviePopular.close();
  }

  setData(data) {
    PopularEntity movies = PopularEntity.fromJson(data);
    _subjectMoviePopular.sink.add(movies);
  }
}