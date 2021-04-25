import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_webapp/external/header.dart';
import 'package:portfolio_webapp/intro.dart';
import 'package:portfolio_webapp/responsive_widget.dart';
import 'package:portfolio_webapp/utils/globals.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Widget arrow_svg = SvgPicture.asset("media/arrow_down.svg", height: 25);

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  bool debugCol = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    largeScreen: Scaffold(
      //      key: Globals.scaffoldKey,
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Stack(children: <Widget>[
              Container(width: double.infinity, height: MediaQuery.of(context).size.height,
                child: SizedBox.expand(
                  child: FittedBox(
                      fit: BoxFit.cover,
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment(-0.8,0),
                      child: SizedBox(
                        width: _controller.value.size?.width ?? 0,
                        height: _controller.value.size?.height ?? 0,
                        child: VideoPlayer(_controller)),
                      )),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  children: [
                    Header(),
                    Intro(),
                    Container(height: 100, child: arrow_svg)
                  ],
                ),
              ),
            ]),
            Container(
              height: 300,
              width: double.infinity,
            )
          ]),
        ));
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset("media/animated_bg.mp4");

    // Set volume to 0 so we can auto-play (important!).
    _controller.setVolume(0);

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.play();
      setState(() {});
    });

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
}
