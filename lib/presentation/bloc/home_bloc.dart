import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';
import 'package:flutter_api_with_retrofit/domain/repository/impl/movie_info_repository_impl.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase{
  HomeBloc() : super(null) {
    moviePopular();
  }

  final MovieRepositoryImpl _repository = MovieRepositoryImpl();

  BehaviorSubject<PopularEntity> get subjectMoviePopular => _subjectMoviePopular;
  final BehaviorSubject<PopularEntity> _subjectMoviePopular = BehaviorSubject<PopularEntity>();

  moviePopular() async {
    var response = await _repository.moviePopular(queryParams);
    PopularEntity movies = PopularEntity.fromJson(response.data);
    _subjectMoviePopular.sink.add(movies);
  }

  dispose() {
    _subjectMoviePopular.close();
  }

  @override
  Future<void> close() async {
    dispose();
    return super.close();
  }

}
