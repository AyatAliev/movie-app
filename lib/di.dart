import 'package:flutter_api_with_retrofit/data/dataSource/impl/movie_data_source_impl.dart';
import 'package:flutter_api_with_retrofit/domain/repository/impl/movie_info_repository_impl.dart';
import 'package:flutter_api_with_retrofit/domain/usecase/movie_use_case.dart';
import 'package:get_it/get_it.dart';
import 'common/api/api_client.dart';

Future<void> template() async{

  /// ApiClient
  GetIt.I.registerSingleton<ApiClient>(ApiClient());

  /// dataSource
  GetIt.I.registerSingleton<MovieImplDataSource>(MovieImplDataSource(GetIt.I<ApiClient>()));

  /// repository
  GetIt.I.registerSingleton<MovieRepositoryImpl>(MovieRepositoryImpl(GetIt.I<MovieImplDataSource>()));

  /// use case
  GetIt.I.registerSingleton<MovieUseCase>(MovieUseCase(GetIt.I<MovieRepositoryImpl>()));
}