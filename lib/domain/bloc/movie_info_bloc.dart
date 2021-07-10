import 'package:flutter_api_with_retrofit/domain/model/movie_info_entity.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/repository/movie_info_repository.dart';

class MovieInfoBloc {

  final MovieInfoRepository _repository = MovieInfoRepository();
  final BehaviorSubject<MovieInfoEntity> _subject = BehaviorSubject<MovieInfoEntity>();

  getInfoMovie(int id) async {
    var response = await _repository.getInfoMovie(id,queryParams);
    MovieInfoEntity movies = MovieInfoEntity().fromJson(response.data);
    _subject.sink.add(movies);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieInfoEntity> get subject => _subject;

}
