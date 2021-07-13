import 'package:json_annotation/json_annotation.dart';

part 'movie_info_entity.g.dart';

@JsonSerializable()
class MovieInfoEntity {
  bool adult;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  int budget;
  List<MovieInfoGenres> genres;
  String homepage;
  int id;
  @JsonKey(name: "imdb_id")
  String imdbId;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "production_companies")
  List<MovieInfoProductionCompanies> productionCompanies;
  @JsonKey(name: "production_countries")
  List<MovieInfoProductionCountries> productionCountries;
  @JsonKey(name: "release_date")
  String releaseDate;
  int revenue;
  int runtime;
  @JsonKey(name: "spoken_languages")
  List<MovieInfoSpokenLanguages> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int voteCount;

  MovieInfoEntity (
      this.voteCount,
      this.voteAverage,
      this.releaseDate,
      this.posterPath,
      this.originalTitle,
      this.originalLanguage,
      this.backdropPath,
      this.title,
      this.popularity,
      this.overview,
      this.id,
      this.adult,
      this.video,
      this.budget,
      this.genres,
      this.homepage,
      this.imdbId,
      this.productionCompanies,
      this.productionCountries,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline);

  factory MovieInfoEntity.fromJson(Map<String, dynamic> json) => _$MovieInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieInfoEntityToJson(this);

}

@JsonSerializable()
class MovieInfoGenres {
  int id;
  String name;

  MovieInfoGenres(this.id,this.name);

  factory MovieInfoGenres.fromJson(Map<String, dynamic> json) => _$MovieInfoGenresFromJson(json);

  Map<String, dynamic> toJson() => _$MovieInfoGenresToJson(this);

}

@JsonSerializable()
class MovieInfoProductionCompanies {
  int id;
  @JsonKey(name: "logo_path")
  String logoPath;
  String name;
  @JsonKey(name: "origin_country")
  String originCountry;

  MovieInfoProductionCompanies(this.name,this.id,this.logoPath,this.originCountry);

  factory MovieInfoProductionCompanies.fromJson(Map<String, dynamic> json) => _$MovieInfoProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$MovieInfoProductionCompaniesToJson(this);

}

@JsonSerializable()
class MovieInfoProductionCountries {
  @JsonKey(name: "iso_3166_1")
  String iso31661;
  String name;

  MovieInfoProductionCountries(this.name,this.iso31661);

  factory MovieInfoProductionCountries.fromJson(Map<String, dynamic> json) => _$MovieInfoProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$MovieInfoProductionCountriesToJson(this);

}

@JsonSerializable()
class MovieInfoSpokenLanguages {
  @JsonKey(name: "english_name")
  String englishName;
  @JsonKey(name: "iso_639_1")
  String iso6391;
  String name;

  MovieInfoSpokenLanguages(this.name,this.englishName,this.iso6391);

  factory MovieInfoSpokenLanguages.fromJson(Map<String, dynamic> json) => _$MovieInfoSpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$MovieInfoSpokenLanguagesToJson(this);

}
