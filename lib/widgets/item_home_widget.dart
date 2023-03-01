import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:flutter/material.dart';

class ItemHomeWidget extends StatelessWidget {
  MovieModel model;
  VoidCallback onTap;
  ItemHomeWidget({required this.model, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.red,
          image: DecorationImage(
              image: NetworkImage(
                //"https://image.tmdb.org/t/p/w500${moviesModel[index].posterPath}",
                "https://image.tmdb.org/t/p/w500${model.posterPath}",
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
                    kBrandPrimaryColor.withOpacity(0.99),
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
                    //moviesModel[index].originalTitle,
                    model.originalTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    //"${moviesModel[index].releaseDate.year}",
                    "${model.releaseDate.year}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
