import 'package:flutter/material.dart';
import 'package:cached_video_player/cached_video_player.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CachedVideoPlayerController controller;
  @override
  void initState() {
    controller = CachedVideoPlayerController.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    controller.initialize().then((_) {
      setState(() {});
      controller.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: controller.value != null && controller.value.initialized
                ? AspectRatio(
              child: CachedVideoPlayer(controller),
              aspectRatio: controller.value.aspectRatio,
            )
                : Center(
              child: CircularProgressIndicator(),
            )),
      ),
    );
  }
}