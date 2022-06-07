import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CharacterMovieWidget extends StatelessWidget {
  String fullName;
  String? characterName;
  String? actorImage;

  CharacterMovieWidget({
    required this.fullName,
    this.characterName,
    this.actorImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 6.0,
      ),
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: actorImage == ""
                  ? NetworkImage(
                      "https://www.dlf.pt/dfpng/middlepng/540-5401046_this-icon-for-gender-neutral-user-circle-hd.png")
                  : NetworkImage("$pathImage$actorImage"),
              radius: 38.0,
            ),
            const SizedBox(height: 5.0),
            Text(
              fullName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
              ),
            ),
            Text(
              characterName ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
