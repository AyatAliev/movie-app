// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieInfoEntity _$MovieInfoEntityFromJson(Map<String, dynamic> json) {
  return MovieInfoEntity(
    json['vote_count'] as int,
    (json['vote_average'] as num)?.toDouble(),
    json['release_date'] as String,
    json['poster_path'] as String,
    json['original_title'] as String,
    json['original_language'] as String,
    json['backdrop_path'] as String,
    json['title'] as String,
    (json['popularity'] as num)?.toDouble(),
    json['overview'] as String,
    json['id'] as int,
    json['adult'] as bool,
    json['video'] as bool,
    json['belongs_to_collection'] as int,
    (json['genres'] as List)
        ?.map((e) => e == null
            ? null
            : MovieInfoGenres.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['homepage'] as String,
    json['imdb_id'] as String,
    (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : MovieInfoProductionCompanies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['production_countries'] as List)
        ?.map((e) => e == null
            ? null
            : MovieInfoProductionCountries.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['revenue'] as int,
    json['runtime'] as int,
    (json['spoken_languages'] as List)
        ?.map((e) => e == null
            ? null
            : MovieInfoSpokenLanguages.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['status'] as String,
    json['tagline'] as String,
  );
}

Map<String, dynamic> _$MovieInfoEntityToJson(MovieInfoEntity instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

MovieInfoGenres _$MovieInfoGenresFromJson(Map<String, dynamic> json) {
  return MovieInfoGenres(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$MovieInfoGenresToJson(MovieInfoGenres instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MovieInfoProductionCompanies _$MovieInfoProductionCompaniesFromJson(
    Map<String, dynamic> json) {
  return MovieInfoProductionCompanies(
    json['name'] as String,
    json['id'] as int,
    json['logo_path'] as String,
    json['origin_country'] as String,
  );
}

Map<String, dynamic> _$MovieInfoProductionCompaniesToJson(
        MovieInfoProductionCompanies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

MovieInfoProductionCountries _$MovieInfoProductionCountriesFromJson(
    Map<String, dynamic> json) {
  return MovieInfoProductionCountries(
    json['name'] as String,
    json['iso_3166_1'] as String,
  );
}

Map<String, dynamic> _$MovieInfoProductionCountriesToJson(
        MovieInfoProductionCountries instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };

MovieInfoSpokenLanguages _$MovieInfoSpokenLanguagesFromJson(
    Map<String, dynamic> json) {
  return MovieInfoSpokenLanguages(
    json['name'] as String,
    json['english_name'] as String,
    json['iso_639_1'] as String,
  );
}

Map<String, dynamic> _$MovieInfoSpokenLanguagesToJson(
        MovieInfoSpokenLanguages instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
