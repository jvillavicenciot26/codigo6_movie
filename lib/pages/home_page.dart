import 'dart:convert';
import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> moviesModel = [];

  getDataInternet() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=17b446c2190bd5ecad9e3efde877e42d&language=en-US&page=1");
    http.Response response = await http.get(url);

    Map data = json.decode(response.body);
    List movies = data["results"];
    moviesModel = movies.map((e) => MovieModel.fromJson(e)).toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 0.7,
          ),
          itemCount: moviesModel.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.red,
                image: DecorationImage(
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500${moviesModel[index].posterPath}",
                    ),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xff111111).withOpacity(0.99),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          moviesModel[index].originalTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "${moviesModel[index].releaseDate.year}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
