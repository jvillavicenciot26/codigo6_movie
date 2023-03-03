import 'dart:convert';
import 'package:codigo6_movieapp/models/genres_model.dart';
import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:codigo6_movieapp/pages/detail_page.dart';
import 'package:codigo6_movieapp/services/api_service.dart';
import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:codigo6_movieapp/widgets/item_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> moviesModel = [];
  List<GenreModel> genresModel = [];

  getDataInternet() async {
    // Uri url = Uri.parse(
    //     "https://api.themoviedb.org/3/discover/movie?api_key=17b446c2190bd5ecad9e3efde877e42d&language=en-US&page=1");
    // http.Response response = await http.get(url);

    // Map data = json.decode(response.body);
    // List movies = data["results"];
    // moviesModel = movies.map((e) => MovieModel.fromJson(e)).toList();
    ApiService apiService = ApiService();
    moviesModel = await apiService.getMovies();
    genresModel = await apiService.getGenders();
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
      backgroundColor: kBrandPrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "TotalCinema",
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 6.0,
                runSpacing: -4,
                children: genresModel
                    .map(
                      (e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            e.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            color: Colors.indigo,
                            width: 50,
                            height: 2,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(14.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: moviesModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemHomeWidget(
                    model: moviesModel[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(idMovie: moviesModel[index].id),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
