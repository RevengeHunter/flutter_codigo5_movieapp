import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/models/movie_gender_model.dart';

class ItemFilterWidget extends StatelessWidget {

  bool isSelect;
  MovieGenderModel movieGenderModel;

  ItemFilterWidget({required this.movieGenderModel, required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 12.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 18.0,
      ),
      decoration: BoxDecoration(
        color: isSelect ? Color(0xff1FCEB5) : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isSelect ? Color(0xff1FCEB5) : Colors.white70,
        ),
        boxShadow: isSelect
            ? [
                BoxShadow(
                  color: const Color(0xff1FCEB5).withOpacity(0.4),
                  blurRadius: 6,
                  offset: const Offset(3, 3),
                )
              ]
            : [],
        gradient: isSelect
            ? LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff97D69D),
            Color(0xff1FCEB5),
          ]
        ) : null,
      ),
      child: Text(
        movieGenderModel.name,
        style: TextStyle(
          color: isSelect ? Colors.black : Colors.white,
          fontWeight: isSelect ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}
