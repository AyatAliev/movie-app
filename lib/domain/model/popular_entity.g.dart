// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularEntity _$PopularEntityFromJson(Map<String, dynamic> json) {
  return PopularEntity(
    (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : PopularResults.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PopularEntityToJson(PopularEntity instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

PopularResults _$PopularResultsFromJson(Map<String, dynamic> json) {
  return PopularResults(
    json['backdrop_path'] as String,
    json['id'] as int,
    json['original_language'] as String,
    json['original_title'] as String,
    json['overview'] as String,
    (json['popularity'] as num)?.toDouble(),
    json['poster_path'] as String,
    json['release_date'] as String,
    json['title'] as String,
    (json['vote_average'] as num)?.toDouble(),
    json['vote_count'] as int,
  );
}

Map<String, dynamic> _$PopularResultsToJson(PopularResults instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
