import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';
import 'package:flutter_api_with_retrofit/domain/usecase/movie_use_case.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  HomeBloc(this._movieUseCase) {
    moviePopular();
  }
  final MovieUseCase _movieUseCase;

  BehaviorSubject<PopularEntity> get subjectMoviePopular => _subjectMoviePopular;
  final BehaviorSubject<PopularEntity> _subjectMoviePopular = BehaviorSubject<PopularEntity>();

  moviePopular() async {
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
