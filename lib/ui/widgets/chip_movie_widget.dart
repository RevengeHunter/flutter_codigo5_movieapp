import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipMovieWidget extends StatelessWidget {

  String textChip;
  ChipMovieWidget({required this.textChip});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        textChip,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
