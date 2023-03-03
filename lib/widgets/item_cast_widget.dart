import 'package:codigo6_movieapp/models/character_model.dart';
import 'package:codigo6_movieapp/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget {
  CharacterModel model;
  ItemCastWidget({required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      constraints: BoxConstraints(
        maxWidth: 110.0,
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white10,
            radius: 40.0,
            backgroundImage:
                //"https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                model.profilePath.isNotEmpty
                    ? NetworkImage(api_image_url + model.profilePath)
                    : NetworkImage(
                        "https://st4.depositphotos.com/4329009/19956/v/450/depositphotos_199564354-stock-illustration-creative-vector-illustration-of-default.jpg"),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            //"Ramón Diaz Gonzales de los Portales",
            model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
