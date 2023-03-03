import 'package:codigo6_movieapp/models/review_model.dart';
import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:flutter/material.dart';

class ItemReviewWidget extends StatelessWidget {
  ReviewModel review;
  ItemReviewWidget({required this.review});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 6.0,
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white10,
            child: Text(
              review.authorDetails.rating.toString(),
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
                //"Juan Manuel Gonzales",
                review.authorDetails.name.isEmpty
                    ? review.authorDetails.username
                    : review.authorDetails.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                //"2022-11-14",
                "${review.createdAt.day.toString()}-${review.createdAt.month.toString()}-${review.createdAt.year.toString()}",
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
          //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
          review.content,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
