import 'package:flutter_api_with_retrofit/data/api/generated/json/base/json_convert_content.dart';
import 'package:flutter_api_with_retrofit/data/api/generated/json/base/json_field.dart';

class PopularEntity with JsonConvert<PopularEntity> {
	int page;
	List<PopularResults> results;
	@JSONField(name: "total_pages")
	int totalPages;
	@JSONField(name: "total_results")
	int totalResults;
}

class PopularResults with JsonConvert<PopularResults> {
	bool adult;
	@JSONField(name: "backdrop_path")
	String backdropPath;
	@JSONField(name: "genre_ids")
	List<int> genreIds;
	int id;
	@JSONField(name: "original_language")
	String originalLanguage;
	@JSONField(name: "original_title")
	String originalTitle;
	String overview;
	double popularity;
	@JSONField(name: "poster_path")
	String posterPath;
	@JSONField(name: "release_date")
	String releaseDate;
	String title;
	bool video;
	@JSONField(name: "vote_average")
	double voteAverage;
	@JSONField(name: "vote_count")
	int voteCount;
}
