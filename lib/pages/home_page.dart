import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/models/movie_model.dart';
import 'package:flutter_codigo5_movieapp/services/api_service.dart';

import '../models/movie_gender_model.dart';
import '../ui/widgets/item_filter_widget.dart';
import '../ui/widgets/item_movie_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieGenderModel> movieGenderList = [];
  List<MovieModel> movieList = [];
  final APIService _apiService = APIService();

  bool isSelected = false;
  int indexFilter = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    _apiService.getMovies().then((value) {
      movieList = value;
      setState(() {});
    });
    _apiService.getGenderMovies().then((value) {
      movieGenderList = value;
      movieGenderList.insert(
        0,
        MovieGenderModel(id: 0, name: "All", select: true),
      );
      indexFilter = movieGenderList[0].id;
      setState(() {});
    });

    setState(() {});
  }

  getMovieFilter(String genderMovie) {
    _apiService.getMoviesByGner(genderMovie).then((value) {
      movieList.clear();
      movieList = value;
      setState(() {});
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161823),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, Mario",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Discover",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffFFFFFF),
                            Color(0xff1FCEB5),
                          ],
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: movieGenderList
                        .map<Widget>(
                          (e) => ItemFilterWidget(
                            movieGenderModel: e,
                            isSelect: indexFilter == e.id ? true : false,
                            onTap: () {
                              indexFilter = e.id;
                              //print("${indexFilter.toString()}-${e.id}");
                              getMovieFilter(e.id.toString());
                              // setState(() {});
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: movieList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemMovieListWidget(
                      movieModel: movieList[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
