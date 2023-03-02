import 'package:codigo6_movieapp/models/movie_detail_model.dart';
import 'package:codigo6_movieapp/services/api_service.dart';
import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:codigo6_movieapp/widgets/item_cast_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  int idMovie;
  DetailPage({required this.idMovie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MovieDetailMode? movie;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    ApiService apiService = ApiService();
    movie = await apiService.getMovieDetails(widget.idMovie);
    print(movie);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: movie != null
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.33,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          //"https://images.wallpapersden.com/image/download/poster-of-dune-2020_bGhmbGmUmZqaraWkpJRoa2lqrWdlamU.jpg",
                          "https://image.tmdb.org/t/p/w500${movie!.backdropPath}",
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                kBrandPrimaryColor,
                                Colors.transparent,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  //"7.235",
                                  movie!.voteAverage.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  //" ! 45324",
                                  " ! ${movie!.voteCount}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    String message =
                                        "Hola espero que estes bien, por favor me envian lo que falta.";
                                    message = message.replaceAll(" ", "%20");
                                    Uri url = Uri.parse(
                                      "https://wa.me/51969461067?text=$message",
                                    );
                                    launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                  },
                                  icon: Icon(
                                    Icons.whatsapp_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          //"Black Panther: Wakanda ForEver",
                          movie!.originalTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              //"162 min",
                              "${movie!.runtime} min",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              //"2022",
                              movie!.releaseDate.year.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Wrap(
                          spacing: 6.0,
                          runSpacing: -4,
                          children: [
                            // ...movie!.genres.map(
                            //   (e) => Chip(
                            //     label: Text(e.name),
                            //   ),
                            // ),
                            //mismo resultado que movie!.genres.map
                            ...List.generate(
                              movie!.genres.length,
                              (index) => Chip(
                                label: Text(
                                  movie!.genres[index].name,
                                ),
                              ),
                            ),
                            // Chip(
                            //   label: Text(
                            //     //"Action",
                            //     movie!.genres[0].name,
                            //   ),
                            // ),
                            // Chip(
                            //   label: Text(
                            //     //"Drama",
                            //     movie!.genres[1].name,
                            //   ),
                            // ),
                            // Chip(
                            //   label: Text(
                            //     //"Science Fiction",
                            //     movie!.genres[2].name,
                            //   ),
                            // ),
                          ],
                        ),
                        Text(
                          //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                          movie!.overview,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        InkWell(
                          onTap: () {
                            Uri url = Uri.parse(movie!.homepage);
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: LinearGradient(
                                colors: [
                                  kBrandSecondaryColor,
                                  Color(0xff973FEF),
                                ],
                              ),
                            ),
                            child: Text(
                              "HomePage",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Top Cast",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Images",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          color: Colors.amber,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: GridView.builder(
                              //padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                return Image.network(
                                  "https://images.pexels.com/photos/1078981/pexels-photo-1078981.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Reviews",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 6.0,
                          ),
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white10,
                                child: Text(
                                  "7.2",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Juan Manuel Gonzales",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "2022-11-14",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          iconColor: kBrandSecondaryColor,
                          collapsedIconColor: Colors.white,
                          childrenPadding: EdgeInsets.symmetric(
                            horizontal: 22.0,
                            vertical: 6.0,
                          ),
                          children: [
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
