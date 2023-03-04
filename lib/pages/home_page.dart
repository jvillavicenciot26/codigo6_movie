import 'dart:convert';
import 'package:codigo6_movieapp/models/genres_model.dart';
import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:codigo6_movieapp/pages/detail_page.dart';
import 'package:codigo6_movieapp/services/api_service.dart';
import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:codigo6_movieapp/widgets/item_filter_widget.dart';
import 'package:codigo6_movieapp/widgets/item_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> moviesModel = [];
  List<MovieModel> moviesModelTemp = [];
  List<GenreModel> genresModel = [];
  int idFilter = 0;
  int counterPage = 1;
  int value = 1;

  ScrollController movieScroller = ScrollController();

  getDataInternet() async {
    // Uri url = Uri.parse(
    //     "https://api.themoviedb.org/3/discover/movie?api_key=17b446c2190bd5ecad9e3efde877e42d&language=en-US&page=1");
    // http.Response response = await http.get(url);

    // Map data = json.decode(response.body);
    // List movies = data["results"];
    // moviesModel = movies.map((e) => MovieModel.fromJson(e)).toList();
    ApiService apiService = ApiService();
    // moviesModel = await apiService.getMovies();
    // moviesModelTemp = moviesModel;
    await getMovies();
    genresModel = await apiService.getGenders();
    genresModel.insert(0, GenreModel(id: 0, name: "All"));
    setState(() {});
  }

  filterMovie(int id) {
    moviesModel = moviesModelTemp;
    if (id != 0) {
      moviesModel = moviesModel
          .where(
            (element) => element.genreIds.contains(id),
          )
          .toList();
    }
    setState(() {});
  }

  getMovies() async {
    ApiService apiService = ApiService();
    moviesModel = [
      ...moviesModelTemp,
      ...await apiService.getMovies(counterPage)
    ];
    moviesModelTemp = moviesModel;
    filterMovie(idFilter);
    setState(() {});
    counterPage++;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieScroller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataInternet();
    movieScroller.addListener(() {
      if (movieScroller.offset >= movieScroller.position.maxScrollExtent) {
        getMovies();
      }
      ;
    });
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
              child: Column(
                children: [
                  Text(
                    "TotalCinema",
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: genresModel
                          .map(
                            (e) => ItemFilterWidget(
                              onTap: () {
                                idFilter = e.id;
                                filterMovie(idFilter);
                              },
                              genreModel: e,
                              isSelected: e.id == idFilter,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    color: Colors.white,
                    child: DropdownButton(
                      value: value,
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "Hola",
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Hola 2",
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Hola 3",
                          ),
                          value: 3,
                        ),
                      ],
                      onChanged: (int? newval) {
                        value = newval!;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                controller: movieScroller,
                shrinkWrap: true,
                //physics: BouncingScrollPhysics(),
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
