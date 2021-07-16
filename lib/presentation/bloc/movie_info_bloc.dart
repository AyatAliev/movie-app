import 'package:flutter_api_with_retrofit/domain/model/movie_info_entity.dart';
import 'package:flutter_api_with_retrofit/domain/usecase/movie_use_case.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:rxdart/rxdart.dart';

class MovieInfoBloc {
  MovieInfoBloc(this._movieUseCase,int id) {
    getInfoMovie(id);
  }

  final MovieUseCase _movieUseCase;

  BehaviorSubject<MovieInfoEntity> get subjectMovieInfo => _subjectMovieInfo;
  final BehaviorSubject<MovieInfoEntity> _subjectMovieInfo = BehaviorSubject<MovieInfoEntity>();

  getInfoMovie(int id) async {
    var response = await _movieUseCase.getInfoMovie(id,queryParams);
    response.fold((l) => print("l"), (r) => setData(r.data));

  }

  dispose() {
    _subjectMovieInfo.close();
  }

  setData(data) {
    MovieInfoEntity movies = MovieInfoEntity.fromJson(data);
    _subjectMovieInfo.sink.add(movies);
  }

}
