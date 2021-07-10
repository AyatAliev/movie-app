import 'package:flutter_api_with_retrofit/domain/model/popular_entity.dart';

popularEntityFromJson(PopularEntity data, Map<String, dynamic> json) {
	if (json['page'] != null) {
		data.page = json['page'] is String
				? int.tryParse(json['page'])
				: json['page'].toInt();
	}
	if (json['results'] != null) {
		data.results = (json['results'] as List).map((v) => PopularResults().fromJson(v)).toList();
	}
	if (json['total_pages'] != null) {
		data.totalPages = json['total_pages'] is String
				? int.tryParse(json['total_pages'])
				: json['total_pages'].toInt();
	}
	if (json['total_results'] != null) {
		data.totalResults = json['total_results'] is String
				? int.tryParse(json['total_results'])
				: json['total_results'].toInt();
	}
	return data;
}

Map<String, dynamic> popularEntityToJson(PopularEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['page'] = entity.page;
	data['results'] =  entity.results?.map((v) => v.toJson())?.toList();
	data['total_pages'] = entity.totalPages;
	data['total_results'] = entity.totalResults;
	return data;
}

popularResultsFromJson(PopularResults data, Map<String, dynamic> json) {
	if (json['adult'] != null) {
		data.adult = json['adult'];
	}
	if (json['backdrop_path'] != null) {
		data.backdropPath = json['backdrop_path'].toString();
	}
	if (json['genre_ids'] != null) {
		data.genreIds = (json['genre_ids'] as List).map((v) => v is String
				? int.tryParse(v)
				: v.toInt()).toList().cast<int>();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['original_language'] != null) {
		data.originalLanguage = json['original_language'].toString();
	}
	if (json['original_title'] != null) {
		data.originalTitle = json['original_title'].toString();
	}
	if (json['overview'] != null) {
		data.overview = json['overview'].toString();
	}
	if (json['popularity'] != null) {
		data.popularity = json['popularity'] is String
				? double.tryParse(json['popularity'])
				: json['popularity'].toDouble();
	}
	if (json['poster_path'] != null) {
		data.posterPath = json['poster_path'].toString();
	}
	if (json['release_date'] != null) {
		data.releaseDate = json['release_date'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['video'] != null) {
		data.video = json['video'];
	}
	if (json['vote_average'] != null) {
		data.voteAverage = json['vote_average'] is String
				? double.tryParse(json['vote_average'])
				: json['vote_average'].toDouble();
	}
	if (json['vote_count'] != null) {
		data.voteCount = json['vote_count'] is String
				? int.tryParse(json['vote_count'])
				: json['vote_count'].toInt();
	}
	return data;
}

Map<String, dynamic> popularResultsToJson(PopularResults entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['adult'] = entity.adult;
	data['backdrop_path'] = entity.backdropPath;
	data['genre_ids'] = entity.genreIds;
	data['id'] = entity.id;
	data['original_language'] = entity.originalLanguage;
	data['original_title'] = entity.originalTitle;
	data['overview'] = entity.overview;
	data['popularity'] = entity.popularity;
	data['poster_path'] = entity.posterPath;
	data['release_date'] = entity.releaseDate;
	data['title'] = entity.title;
	data['video'] = entity.video;
	data['vote_average'] = entity.voteAverage;
	data['vote_count'] = entity.voteCount;
	return data;
}