import 'dart:convert';
import 'package:codigo6_movieapp/models/backdrops_model.dart';
import 'package:codigo6_movieapp/models/character_model.dart';
import 'package:codigo6_movieapp/models/genres_model.dart';
import 'package:codigo6_movieapp/models/movie_detail_model.dart';
import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:codigo6_movieapp/models/review_model.dart';
import 'package:codigo6_movieapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<MovieModel>> getMovies() async {
    Uri url = Uri.parse(
        "$api_url/discover/movie?api_key=$api_key&language=en-US&page=1");
    http.Response response = await http.get(url);

    Map data = json.decode(response.body);
    List movies = data["results"];
    List<MovieModel> moviesModel = [];
    moviesModel = movies.map((e) => MovieModel.fromJson(e)).toList();
    return moviesModel;
  }

  Future<List<GenreModel>> getGenders() async {
    Uri url =
        Uri.parse("$api_url/genre/movie/list?api_key=$api_key&language=en-US");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    List genresList = data["genres"];
    List<GenreModel> genres = [];
    genres = genresList.map((e) => GenreModel.fromJson(e)).toList();
    print(genres);
    return genres;
  }

  Future<MovieDetailMode> getMovieDetails(int id) async {
    Uri url = Uri.parse("$api_url/movie/$id?api_key=$api_key&language=en-US");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    MovieDetailMode movieDetailModel = MovieDetailMode.fromJson(data);
    return movieDetailModel;
  }

  Future<List<CharacterModel>> getCharacters(int id) async {
    Uri url =
        Uri.parse("$api_url/movie/$id/credits?api_key=$api_key&language=en-US");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    List castList = data["cast"];
    List<CharacterModel> characteres = [];
    characteres = castList.map((e) => CharacterModel.fromJson(e)).toList();
    //print(characteres);
    return characteres;
  }

  Future<List<BackDropsModel>> getBackDrops(int id) async {
    Uri url = Uri.parse("$api_url/movie/$id/images?api_key=$api_key");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    List backdropsList = data["backdrops"];
    List<BackDropsModel> backdrops = [];
    backdrops = backdropsList.map((e) => BackDropsModel.fromJson(e)).toList();
    //print(backdrops);
    return backdrops;
  }

  Future<List<ReviewModel>> getReviews(int id) async {
    Uri url =
        Uri.parse("$api_url/movie/$id/reviews?api_key=$api_key&language=en-US");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    List reviewsList = data["results"];
    List<ReviewModel> reviews = [];
    reviews = reviewsList.map((e) => ReviewModel.fromJson(e)).toList();
    //print(reviews);
    return reviews;
  }
}
