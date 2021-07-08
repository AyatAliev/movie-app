import 'package:flutter_api_with_retrofit/model/movie_info_entity.dart';

movieInfoEntityFromJson(MovieInfoEntity data, Map<String, dynamic> json) {
	if (json['adult'] != null) {
		data.adult = json['adult'];
	}
	if (json['backdrop_path'] != null) {
		data.backdropPath = json['backdrop_path'].toString();
	}
	if (json['budget'] != null) {
		data.budget = json['budget'] is String
				? int.tryParse(json['budget'])
				: json['budget'].toInt();
	}
	if (json['genres'] != null) {
		data.genres = (json['genres'] as List).map((v) => MovieInfoGenres().fromJson(v)).toList();
	}
	if (json['homepage'] != null) {
		data.homepage = json['homepage'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['imdb_id'] != null) {
		data.imdbId = json['imdb_id'].toString();
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
	if (json['production_companies'] != null) {
		data.productionCompanies = (json['production_companies'] as List).map((v) => MovieInfoProductionCompanies().fromJson(v)).toList();
	}
	if (json['production_countries'] != null) {
		data.productionCountries = (json['production_countries'] as List).map((v) => MovieInfoProductionCountries().fromJson(v)).toList();
	}
	if (json['release_date'] != null) {
		data.releaseDate = json['release_date'].toString();
	}
	if (json['revenue'] != null) {
		data.revenue = json['revenue'] is String
				? int.tryParse(json['revenue'])
				: json['revenue'].toInt();
	}
	if (json['runtime'] != null) {
		data.runtime = json['runtime'] is String
				? int.tryParse(json['runtime'])
				: json['runtime'].toInt();
	}
	if (json['spoken_languages'] != null) {
		data.spokenLanguages = (json['spoken_languages'] as List).map((v) => MovieInfoSpokenLanguages().fromJson(v)).toList();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	if (json['tagline'] != null) {
		data.tagline = json['tagline'].toString();
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

Map<String, dynamic> movieInfoEntityToJson(MovieInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['adult'] = entity.adult;
	data['backdrop_path'] = entity.backdropPath;
	data['budget'] = entity.budget;
	data['genres'] =  entity.genres?.map((v) => v.toJson())?.toList();
	data['homepage'] = entity.homepage;
	data['id'] = entity.id;
	data['imdb_id'] = entity.imdbId;
	data['original_language'] = entity.originalLanguage;
	data['original_title'] = entity.originalTitle;
	data['overview'] = entity.overview;
	data['popularity'] = entity.popularity;
	data['poster_path'] = entity.posterPath;
	data['production_companies'] =  entity.productionCompanies?.map((v) => v.toJson())?.toList();
	data['production_countries'] =  entity.productionCountries?.map((v) => v.toJson())?.toList();
	data['release_date'] = entity.releaseDate;
	data['revenue'] = entity.revenue;
	data['runtime'] = entity.runtime;
	data['spoken_languages'] =  entity.spokenLanguages?.map((v) => v.toJson())?.toList();
	data['status'] = entity.status;
	data['tagline'] = entity.tagline;
	data['title'] = entity.title;
	data['video'] = entity.video;
	data['vote_average'] = entity.voteAverage;
	data['vote_count'] = entity.voteCount;
	return data;
}

movieInfoGenresFromJson(MovieInfoGenres data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> movieInfoGenresToJson(MovieInfoGenres entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

movieInfoProductionCompaniesFromJson(MovieInfoProductionCompanies data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['logo_path'] != null) {
		data.logoPath = json['logo_path'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['origin_country'] != null) {
		data.originCountry = json['origin_country'].toString();
	}
	return data;
}

Map<String, dynamic> movieInfoProductionCompaniesToJson(MovieInfoProductionCompanies entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['logo_path'] = entity.logoPath;
	data['name'] = entity.name;
	data['origin_country'] = entity.originCountry;
	return data;
}

movieInfoProductionCountriesFromJson(MovieInfoProductionCountries data, Map<String, dynamic> json) {
	if (json['iso_3166_1'] != null) {
		data.iso31661 = json['iso_3166_1'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> movieInfoProductionCountriesToJson(MovieInfoProductionCountries entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['iso_3166_1'] = entity.iso31661;
	data['name'] = entity.name;
	return data;
}

movieInfoSpokenLanguagesFromJson(MovieInfoSpokenLanguages data, Map<String, dynamic> json) {
	if (json['english_name'] != null) {
		data.englishName = json['english_name'].toString();
	}
	if (json['iso_639_1'] != null) {
		data.iso6391 = json['iso_639_1'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> movieInfoSpokenLanguagesToJson(MovieInfoSpokenLanguages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['english_name'] = entity.englishName;
	data['iso_639_1'] = entity.iso6391;
	data['name'] = entity.name;
	return data;
}