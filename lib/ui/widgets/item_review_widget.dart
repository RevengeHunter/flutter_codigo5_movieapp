import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/models/movie_review_model.dart';

class ItemReviewWidget extends StatelessWidget {
  MovieReviewModel reviewModel;
  ItemReviewWidget({
    required this.reviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      collapsedIconColor: Colors.white,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      title: Text(
        reviewModel.author,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            "${reviewModel.createdAt.toString().substring(0, 10)}",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 20.0,),
          Icon(
            Icons.star,
            color: Colors.white54,
            size: 14.0,
          ),
          Text(
            "${reviewModel.authorDetails.rating.toString()}",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ],
      ),
      //leading: Icon(Icons.check,),
      children: [
        Text(
          reviewModel.content,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
