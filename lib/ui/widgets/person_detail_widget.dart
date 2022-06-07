import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/models/person_model.dart';
import 'package:video_player/video_player.dart';

import '../../services/api_service.dart';
import '../../utils/constants.dart';
import '../general/colors.dart';

class PersonDetailWidget extends StatefulWidget {
  String personId;
  PersonDetailWidget({required this.personId});

  @override
  State<PersonDetailWidget> createState() => _PersonDetailWidgetState();
}

class _PersonDetailWidgetState extends State<PersonDetailWidget> {
  final APIService _apiService = APIService();

  PersonModel? personModel;
  bool isLoading = true;
  int count = 0;

  @override
  void initState() {
    super.initState();
    getPerson();
  }

  getPerson() async {
    personModel = await _apiService.getPerson(widget.personId);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBrandPrimaryColor,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      content: !isLoading
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "$pathImage${personModel?.profilePath}"),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "${personModel?.name}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "${personModel?.placeOfBirth}",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "${personModel?.birthday.toString().substring(0, 10)}",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "Popularity: ${personModel?.popularity}",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        count.toString(),
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                        ),
                      ),
                      ElevatedButton(onPressed: (){
                        count++;
                        setState(() {

                        });
                      }, child: Text("Vote",),),
                    ],
                  ),
                ),
              ],
            )
          : SizedBox(
              height: 300,
              child: const Center(
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: CircularProgressIndicator(
                    color: kBrandSecondaryColor,
                    strokeWidth: 2.0,
                  ),
                ),
              ),
            ),
    );
  }
}
