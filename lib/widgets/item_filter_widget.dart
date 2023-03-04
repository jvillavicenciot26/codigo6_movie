import 'package:codigo6_movieapp/models/genres_model.dart';
import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ItemFilterWidget extends StatelessWidget {
  GenreModel genreModel;
  bool isSelected;
  VoidCallback onTap;
  ItemFilterWidget(
      {required this.genreModel,
      required this.isSelected,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              genreModel.name,
              style: TextStyle(
                fontSize: 16.0,
                color: isSelected ? Colors.white : Colors.white38,
                fontWeight: FontWeight.w500,
              ),
            ),
            isSelected
                ? Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                      color: kBrandSecondaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
