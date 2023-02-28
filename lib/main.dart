import 'dart:convert';

import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:codigo6_movieapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // getDataInternet() async {
    //   Uri url = Uri.parse(
    //       "https://api.themoviedb.org/3/discover/movie?api_key=17b446c2190bd5ecad9e3efde877e42d&language=en-US&page=1");
    //   http.Response response = await http.get(url);
    //   // print(response);
    //   // print(response.statusCode);
    //   // print(response.body);

    //   Map data = json.decode(response.body);
    //   //print(data["results"][0]["original_title"]);
    //   // data["results"].foreach((item) {
    //   //   print(item["original_title"]);
    //   // });

    //   List movies = data["results"];
    //   // for (var item in movies) {
    //   //   print(item["original_title"]);
    //   // }

    //   List<MovieModel> moviesModel =
    //       movies.map((e) => MovieModel.fromJson(e)).toList();
    //   print(moviesModel);

    //   // Uri url1 = Uri.parse(
    //   //     "https://api.themoviedb.org/3/movie/505642?api_key=17b446c2190bd5ecad9e3efde877e42d&language=en-US");
    //   // http.Response response1 = await http.get(url1);
    //   // Map data1 = json.decode(response1.body);
    //   // List genres = data1["genres"];
    //   // print(data1["original_title"]);
    //   // genres.forEach((element) {
    //   //   print("- ${element["name"]}");
    //   // });
    // }

    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),
      home: HomePage(),
    );
  }
}
