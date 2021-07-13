import 'package:flutter_api_with_retrofit/domain/model/movie_info_entity.dart';
import 'package:flutter_api_with_retrofit/domain/repository/impl/movie_info_repository_impl.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class MovieInfoBloc extends BlocBase {

  MovieInfoBloc(int id) : super(null) {
    getInfoMovie(id);
  }

  final MovieRepositoryImpl _repository = MovieRepositoryImpl();

  BehaviorSubject<MovieInfoEntity> get subjectMovieInfo => _subjectMovieInfo;
  final BehaviorSubject<MovieInfoEntity> _subjectMovieInfo = BehaviorSubject<MovieInfoEntity>();

  getInfoMovie(int id) async {
    var response = await _repository.getInfoMovie(id,queryParams);
    MovieInfoEntity movies = MovieInfoEntity.fromJson(response.data);
    _subjectMovieInfo.sink.add(movies);
  }

  dispose() {
    _subjectMovieInfo.close();
  }

  @override
  Future<void> close() {
    dispose();
    return super.close();
  }
}
