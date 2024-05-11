import 'package:ayal_sahabe/Model/colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class playing_page extends StatefulWidget {
  final String videourl;
  final String videoid;

  const playing_page(
      {super.key,
      required this.videourl,
      required this.videoid,
      required videoTitle});

  @override
  State<playing_page> createState() => _viewpageState();
}

class _viewpageState extends State<playing_page> {
  String? videoId;
  YoutubePlayerController? _controller;
  @override
  void initState() {
    videoId = YoutubePlayer.convertUrlToId(widget.videourl);
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        hideThumbnail: false,
        hideControls: false,
        enableCaption: true,
        autoPlay: true,
        mute: false,
        showLiveFullscreenButton: true,
        captionLanguage: 'uig',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height -
                  45 //to get height of screen
              ,
              width:
                  MediaQuery.of(context).size.width, //to get height of screen

              color: serik,
              child: YoutubePlayer(
                actionsPadding: const EdgeInsets.all(0.0),
                aspectRatio: 16 / 9,
                controlsTimeOut: const Duration(seconds: 3),
                progressColors: const ProgressBarColors(
                  bufferedColor: Colors.grey,
                  playedColor: serik,
                  handleColor: Colors.amberAccent,
                ),
                showVideoProgressIndicator: true,
                controller: _controller!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
