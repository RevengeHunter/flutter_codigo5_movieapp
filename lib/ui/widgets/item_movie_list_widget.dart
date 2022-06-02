import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/movie_model.dart';

class ItemMovieListWidget extends StatelessWidget {

  ItemMovieListWidget({
    required this.movieModel,
  });

  MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      width: double.infinity,
      height: height * 0.65,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: const Offset(4, 4),
            blurRadius: 12.0,
          ),
        ],
        borderRadius: BorderRadius.circular(22.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "http://image.tmdb.org/t/p/w500${movieModel.posterPath}", //"https://wallpapercave.com/wp/wp9168249.jpg"),
          ),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(22.0),
                  bottomLeft: Radius.circular(22.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movieModel.originalTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    height: 2.0,
                    width: width*0.3,
                    color: Color(0xff1FCEB5),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    movieModel.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            movieModel.releaseDate.toString().substring(0,10),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up_alt,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            movieModel.voteCount
                                .toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(14.0),
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                //color: Colors.black.withOpacity(0.65),
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    movieModel.voteAverage.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 2.0,),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}