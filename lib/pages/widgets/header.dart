/* import 'package:app_fconfianza_emprendedores/app/theme/app_theme.dart'; */
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/pages/constants.dart';
import 'package:video_player/video_player.dart';

class Header extends StatefulWidget {
  Header({
    required this.path,
  });
  final String path;
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late BetterPlayerController _betterPlayerController;
  BetterPlayerDataSource? _dataSource;
  BetterPlayerTheme _playerTheme = BetterPlayerTheme.material;

/*    List<BetterPlayerDataSource> createDataSet() {
    List<BetterPlayerDataSource> dataSourceList = [];
    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      ),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
    );
    return dataSourceList;
  } */

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    _playVideo();
  }

  @override
  void dispose() {
    super.dispose();
    _betterPlayerController.dispose();
  }

  void _playVideo() {
    String url = Constants.bugBuckBunnyVideoUrl;
    _dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.path,
    );
    _betterPlayerController = new BetterPlayerController(
      BetterPlayerConfiguration(
        aspectRatio: 16 / 11,
        autoDispose: true,
        autoPlay: true,
        fit: BoxFit.cover,
        placeholderOnTop: false,
        systemOverlaysAfterFullScreen: [],
        autoDetectFullscreenDeviceOrientation: true,
        autoDetectFullscreenAspectRatio: true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
        ],
        /* errorBuilder: (context, errorMessage) {
          print("errorMessage -> $errorMessage");
          return CircleAvatar();
        }, */
        controlsConfiguration: BetterPlayerControlsConfiguration(
          playerTheme: _playerTheme,
          controlsHideTime: Duration(milliseconds: 100),
          controlBarColor: Colors.black45,
        ),
      ),
      betterPlayerDataSource: _dataSource,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //floating: true,
      //pinned: true,
      stretchTriggerOffset: 220.0,
      expandedHeight: 220.0, //MediaQuery.of(context).size.height * .20,
      //floating: false,
      forceElevated: true,
      toolbarHeight: 220.0,

      /// To make the app bar visible at all times after collapsing
      /// we set pinned to true
      //pinned: true,
      pinned: true,
      //stretch: true,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.zoomBackground,
          //StretchMode.blurBackground,
          //StretchMode.fadeTitle,
        ],
        background: BetterPlayer(
          controller: _betterPlayerController,
        ),
        /*  background: _betterPlayerController!.isVideoInitialized()
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(), */
      ),
    );
  }
}
