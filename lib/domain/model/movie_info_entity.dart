import 'package:flutter_api_with_retrofit/data/api/generated/json/base/json_convert_content.dart';
import 'package:flutter_api_with_retrofit/data/api/generated/json/base/json_field.dart';

class MovieInfoEntity with JsonConvert<MovieInfoEntity> {
	bool adult;
	@JSONField(name: "backdrop_path")
	String backdropPath;
	@JSONField(name: "belongs_to_collection")
	int budget;
	List<MovieInfoGenres> genres;
	String homepage;
	int id;
	@JSONField(name: "imdb_id")
	String imdbId;
	@JSONField(name: "original_language")
	String originalLanguage;
	@JSONField(name: "original_title")
	String originalTitle;
	String overview;
	double popularity;
	@JSONField(name: "poster_path")
	String posterPath;
	@JSONField(name: "production_companies")
	List<MovieInfoProductionCompanies> productionCompanies;
	@JSONField(name: "production_countries")
	List<MovieInfoProductionCountries> productionCountries;
	@JSONField(name: "release_date")
	String releaseDate;
	int revenue;
	int runtime;
	@JSONField(name: "spoken_languages")
	List<MovieInfoSpokenLanguages> spokenLanguages;
	String status;
	String tagline;
	String title;
	bool video;
	@JSONField(name: "vote_average")
	double voteAverage;
	@JSONField(name: "vote_count")
	int voteCount;
}

class MovieInfoGenres with JsonConvert<MovieInfoGenres> {
	int id;
	String name;
}

class MovieInfoProductionCompanies with JsonConvert<MovieInfoProductionCompanies> {
	int id;
	@JSONField(name: "logo_path")
	String logoPath;
	String name;
	@JSONField(name: "origin_country")
	String originCountry;
}

class MovieInfoProductionCountries with JsonConvert<MovieInfoProductionCountries> {
	@JSONField(name: "iso_3166_1")
	String iso31661;
	String name;
}

class MovieInfoSpokenLanguages with JsonConvert<MovieInfoSpokenLanguages> {
	@JSONField(name: "english_name")
	String englishName;
	@JSONField(name: "iso_639_1")
	String iso6391;
	String name;
}
