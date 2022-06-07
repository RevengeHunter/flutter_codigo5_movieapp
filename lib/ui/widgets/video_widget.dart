// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  // late YoutubePlayerController _controller;
  // late TextEditingController _idController;
  // late TextEditingController _seekToController;
  //
  // late PlayerState _playerState;
  // late YoutubeMetaData _videoMetaData;
  // double _volume = 100;
  // bool _muted = false;
  // bool _isPlayerReady = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = YoutubePlayerController(
  //     initialVideoId: "2OMixTIRQcY",
  //     flags: const YoutubePlayerFlags(
  //       mute: false,
  //       autoPlay: true,
  //       disableDragSeek: false,
  //       loop: false,
  //       isLive: false,
  //       forceHD: false,
  //       enableCaption: true,
  //     ),
  //   )..addListener(listener);
  //   _idController = TextEditingController();
  //   _seekToController = TextEditingController();
  //   _videoMetaData = const YoutubeMetaData();
  //   _playerState = PlayerState.unknown;
  // }
  //
  // void listener() {
  //   if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
  //     setState(() {
  //       _playerState = _controller.value.playerState;
  //       _videoMetaData = _controller.metadata;
  //     });
  //   }
  // }
  //
  // @override
  // void deactivate() {
  //   // Pauses video while navigating to next page.
  //   _controller.pause();
  //   super.deactivate();
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   _idController.dispose();
  //   _seekToController.dispose();
  //   super.dispose();
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return YoutubePlayerBuilder(
  //     onExitFullScreen: () {
  //       // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
  //       SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  //     },
  //     player: YoutubePlayer(
  //       controller: _controller,
  //       showVideoProgressIndicator: true,
  //       progressIndicatorColor: Colors.blueAccent,
  //       topActions: <Widget>[
  //         const SizedBox(width: 8.0),
  //         Expanded(
  //           child: Text(
  //             _controller.metadata.title,
  //             style: const TextStyle(
  //               color: Colors.white,
  //               fontSize: 18.0,
  //             ),
  //             overflow: TextOverflow.ellipsis,
  //             maxLines: 1,
  //           ),
  //         ),
  //         IconButton(
  //           icon: const Icon(
  //             Icons.settings,
  //             color: Colors.white,
  //             size: 25.0,
  //           ),
  //           onPressed: () {
  //             log('Settings Tapped!');
  //           },
  //         ),
  //       ],
  //       onReady: () {
  //         _isPlayerReady = true;
  //       },
  //     ),
  //     builder: (context, player) => Scaffold(
  //       appBar: AppBar(
  //         leading: Padding(
  //           padding: const EdgeInsets.only(left: 12.0),
  //           child: Image.asset(
  //             'assets/ypf.png',
  //             fit: BoxFit.fitWidth,
  //           ),
  //         ),
  //         title: const Text(
  //           'Youtube Player Flutter',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
