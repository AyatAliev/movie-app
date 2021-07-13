import 'package:json_annotation/json_annotation.dart';

part 'popular_entity.g.dart';

@JsonSerializable()
class PopularEntity {
	List<PopularResults> results;

	PopularEntity(this.results);

	factory PopularEntity.fromJson(Map<String, dynamic> json) => _$PopularEntityFromJson(json);

	Map<String, dynamic> toJson() => _$PopularEntityToJson(this);

}

@JsonSerializable()
class PopularResults {
	@JsonKey(name: "backdrop_path")
	String backdropPath;
	int id;
	@JsonKey(name: "original_language")
	String originalLanguage;
	@JsonKey(name: "original_title")
	String originalTitle;
	String overview;
	double popularity;
	@JsonKey(name: "poster_path")
	String posterPath;
	@JsonKey(name: "release_date")
	String releaseDate;
	String title;
	@JsonKey(name: "vote_average")
	double voteAverage;
	@JsonKey(name: "vote_count")
	int voteCount;

	PopularResults(
			this.backdropPath,
			this.id,
			this.originalLanguage,
			this.originalTitle,
			this.overview,
			this.popularity,
			this.posterPath,
			this.releaseDate,
			this.title,
			this.voteAverage,
			this.voteCount
			);

	factory PopularResults.fromJson(Map<String, dynamic> json) => _$PopularResultsFromJson(json);

	Map<String, dynamic> toJson() => _$PopularResultsToJson(this);
}
