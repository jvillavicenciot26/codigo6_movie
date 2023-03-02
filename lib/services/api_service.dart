import 'dart:convert';
import 'package:codigo6_movieapp/models/movie_detail_model.dart';
import 'package:codigo6_movieapp/models/movie_model.dart';
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

  Future<MovieDetailMode> getMovieDetails(int id) async {
    Uri url = Uri.parse("$api_url/movie/$id?api_key=$api_key&language=en-US");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    MovieDetailMode movieDetailModel = MovieDetailMode.fromJson(data);
    return movieDetailModel;
  }
}
