import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import '../general/colors.dart';

class PictureDetailWidget extends StatefulWidget {
  String pictureURLId;
  PictureDetailWidget({required this.pictureURLId});

  @override
  State<PictureDetailWidget> createState() => _PictureDetailWidgetState();
}

class _PictureDetailWidgetState extends State<PictureDetailWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: kBrandPrimaryColor,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.0),
                topLeft: Radius.circular(12.0),
              ),
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: NetworkImage("${widget.pictureURLId}"),
              // ),
            ),
            child: PinchZoom(
              child: Image.network(
                "${widget.pictureURLId}",
                fit: BoxFit.contain,
              ),
              resetDuration: const Duration(milliseconds: 1000),
              maxScale: 10,
              onZoomStart: (){print('Start zooming');},
              onZoomEnd: (){print('Stop zooming');},
            ),
          ),
        ],
      ),
    );
  }
}
