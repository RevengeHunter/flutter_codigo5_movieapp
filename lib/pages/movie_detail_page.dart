import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/models/movie_credit_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_detail_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_image_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_review_model.dart';
import 'package:flutter_codigo5_movieapp/ui/general/colors.dart';
import 'package:flutter_codigo5_movieapp/ui/widgets/character_movie_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/api_service.dart';
import '../ui/widgets/chip_movie_widget.dart';
import '../ui/widgets/item_review_widget.dart';
import '../ui/widgets/person_detail_widget.dart';
import '../ui/widgets/picture_detail_widget.dart';
import '../ui/widgets/title_description_widget.dart';
import '../utils/constants.dart';

class MovieDetailPage extends StatefulWidget {
  int movieId;
  MovieDetailPage({required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final APIService _apiService = APIService();

  MovieDetailModel? movieDetailModel;
  MovieCreditModel? movieCreditModel;
  List<MovieImageModel> movieImageModelList = [];
  List<MovieReviewModel> movieReviewModel = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    movieDetailModel =
        await _apiService.getDetailMovie(widget.movieId.toString());

    movieCreditModel =
        await _apiService.getCreditMovie(widget.movieId.toString());

    movieReviewModel =
        await _apiService.getReviewMovie(widget.movieId.toString());

    movieImageModelList =
        await _apiService.getMovieImage(widget.movieId.toString());

    isLoading = false;
    setState(() {});
  }

  showDetailCast(String idPerson) {
    showDialog(
      context: context,
      builder: (BuildContext context) => PersonDetailWidget(
        personId: idPerson,
      ),
    );
  }

  showPicture(String idPicture) {
    showDialog(
      context: context,
      builder: (BuildContext context) => PictureDetailWidget(
        pictureURLId: idPicture,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      //Siempre Utilizar un Custom Scroll View cuando se use un SliverApp
      body: !isLoading
          ? CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  expandedHeight: 230.0,
                  elevation: 0,
                  backgroundColor: kBrandPrimaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                      ),
                      child: Text(
                        movieDetailModel?.title ?? "",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    centerTitle: true,
                    background: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Image.network(
                          "$pathImage${movieDetailModel?.posterPath ?? ""}", //"http://image.tmdb.org/t/p/w500/7ucaMpXAmlIM24qZZ8uI9hCY0hm.jpg",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  kBrandPrimaryColor.withOpacity(0.7),
                                  kBrandPrimaryColor.withOpacity(0.0),
                                  kBrandPrimaryColor.withOpacity(0.7),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floating: true,
                  snap: false,
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14.0,
                          vertical: 16.0,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 160,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                // color: Colors.redAccent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "$pathImage${movieDetailModel?.posterPath ?? ""}"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        color: Colors.white54,
                                        size: 14.0,
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Text(
                                        "${movieDetailModel?.releaseDate.toString().substring(0, 10) ?? ""}",
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${movieDetailModel?.title ?? ""}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        color: Colors.white54,
                                        size: 14.0,
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Text(
                                        "${movieDetailModel?.runtime.toString() ?? ""}",
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleDescriptionWidget(title: "Overview"),
                            Text(
                              "${movieDetailModel?.overview ?? ""}",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50.0,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Uri _url = Uri.parse(
                                      movieDetailModel?.homepage ?? "");
                                  launchUrl(_url);
                                },
                                icon: const Icon(
                                  Icons.link,
                                  color: kBrandPrimaryColor,
                                ),
                                label: const Text(
                                  "Home Page",
                                  style: TextStyle(
                                    color: kBrandPrimaryColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: kBrandSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TitleDescriptionWidget(
                              title: "Genres",
                            ),
                            Wrap(
                              spacing: 8.0,
                              children: movieDetailModel?.genres
                                      .map<Widget>((e) =>
                                          ChipMovieWidget(textChip: e.name))
                                      .toList() ??
                                  [],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TitleDescriptionWidget(
                              title: "Cast",
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: movieCreditModel?.cast
                                        .map<Widget>((e) => GestureDetector(
                                              onTap: () {
                                                showDetailCast(e.id.toString());
                                              },
                                              child: CharacterMovieWidget(
                                                  fullName: e.originalName,
                                                  characterName: e.character,
                                                  actorImage: e.profilePath),
                                            ))
                                        .toList() ??
                                    [],
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TitleDescriptionWidget(
                              title: "Images",
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              padding: EdgeInsets.zero,
                              children: movieImageModelList
                                  .map(
                                    (e) => GestureDetector(
                                      onDoubleTap: (){
                                        print("$pathImage${e.filePath}");
                                        showPicture("$pathImage${e.filePath}");
                                        setState(() {

                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 5.0),
                                        child: Image.network(
                                          "$pathImage${e.filePath}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TitleDescriptionWidget(
                              title: "Reviews",
                            ),
                            Column(
                              children: movieReviewModel
                                  .map((e) => ItemReviewWidget(
                                        reviewModel: e,
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: SizedBox(
                height: 26,
                width: 26,
                child: CircularProgressIndicator(
                  color: kBrandSecondaryColor,
                  strokeWidth: 2.0,
                ),
              ),
            ),
    );
  }
}
