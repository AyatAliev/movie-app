import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';
import 'package:flutter_api_with_retrofit/domain/repository/impl/movie_info_repository_impl.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  HomeBloc() {
    moviePopular();
  }

  final MovieRepositoryImpl _repository = MovieRepositoryImpl();

  final BehaviorSubject<PopularEntity> _subjectMoviePopular =
      BehaviorSubject<PopularEntity>();
  BehaviorSubject<PopularEntity> get subjectMoviePopular => _subjectMoviePopular;

  moviePopular() async {
    var response = await _repository.moviePopular(queryParams);
    PopularEntity movies = PopularEntity.fromJson(response.data);
    _subjectMoviePopular.sink.add(movies);
  }

  dispose() {
    _subjectMoviePopular.close();
  }
}
