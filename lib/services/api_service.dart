import 'dart:convert';

import 'package:flutter_codigo5_movieapp/models/movie_gender_model.dart';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';
import '../utils/constants.dart';
class APIService{

  Future<List<MovieModel>> getMovies() async {
    Uri url = Uri.parse(
        "$pathProducction/discover/movie?api_key=$apiKey");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      List movies = myMap["results"];
      List<MovieModel> movieList =
          movies.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
      return movieList;
    }

    return [];
  }

  Future<List<MovieGenderModel>> getGenderMovies() async {
    Uri url = Uri.parse(
        "$pathProducction/genre/movie/list?api_key=$apiKey");
    http.Response response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      List genderMovie = myMap["genres"];
      print(genderMovie);
      List<MovieGenderModel> movieGenderList = genderMovie
          .map<MovieGenderModel>((e) => MovieGenderModel.fromJson(e))
          .toList();
      return movieGenderList;
    }
    return [];
  }

}