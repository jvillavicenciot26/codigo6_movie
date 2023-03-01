import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 110.0,
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white10,
            radius: 40.0,
            backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Ramón Diaz Gonzales de los Portales",
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
