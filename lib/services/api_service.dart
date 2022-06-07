import 'dart:convert';

import 'package:flutter_codigo5_movieapp/models/movie_credit_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_detail_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_gender_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_image_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_review_model.dart';
import 'package:flutter_codigo5_movieapp/models/person_model.dart';
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

  Future<List<MovieModel>> getMoviesByGner(String gnerName) async {
    Uri url = Uri.parse(
        "$pathProducction/discover/movie?api_key=$apiKey&with_genres=$gnerName");
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
    //print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      List genderMovie = myMap["genres"];
      // print(genderMovie);
      List<MovieGenderModel> movieGenderList = genderMovie
          .map<MovieGenderModel>((e) => MovieGenderModel.fromJson(e))
          .toList();
      return movieGenderList;
    }
    return [];
  }

  //Se tiene que indicar, que en caso no encuentre devolvera null
  Future<MovieDetailModel?> getDetailMovie(String idMovie) async {
    Uri url = Uri.parse(
        "$pathProducction/movie/$idMovie?api_key=$apiKey");
    http.Response response = await http.get(url);
    //print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      MovieDetailModel movieDetailModel = MovieDetailModel.fromJson(myMap);
      return movieDetailModel;
    }
    return null;
  }

  Future<MovieCreditModel?> getCreditMovie(String idMovie) async {
    Uri url = Uri.parse(
        "$pathProducction/movie/$idMovie/credits?api_key=$apiKey");
    http.Response response = await http.get(url);
    //print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      MovieCreditModel movieCreditModel = MovieCreditModel.fromJson(myMap);
      return movieCreditModel;
    }
    return null;
  }

  Future<List<MovieReviewModel>> getReviewMovie(String idMovie) async {
    Uri url = Uri.parse(
        "$pathProducction/movie/$idMovie/reviews?api_key=$apiKey&page=1");
    http.Response response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      List reviewsMovie = myMap["results"];
      List<MovieReviewModel> movieReviewModel = reviewsMovie.map((e) => MovieReviewModel.fromJson(e)).toList();
      return movieReviewModel;
    }
    return [];
  }

  Future<PersonModel?> getPerson(String idPerson) async {
    Uri url = Uri.parse(
        "$pathProducction/person/$idPerson?api_key=$apiKey");
    http.Response response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      PersonModel personModel = PersonModel.fromJson(myMap);
      return personModel;
    }
    return null;
  }

  Future<List<MovieImageModel>> getMovieImage(String idMovie) async {
    Uri url = Uri.parse(
        "$pathProducction/movie/$idMovie/images?api_key=$apiKey");
    http.Response response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      List imagesMovie = myMap["backdrops"];
      List<MovieImageModel> listMovieImageModel = imagesMovie.map((e) => MovieImageModel.fromJson(e)).toList();
      return listMovieImageModel;
    }
    return [];
  }

}