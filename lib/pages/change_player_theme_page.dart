import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter_application_2/pages/constants.dart';
import 'package:flutter_application_2/pages/custom_controls_widget.dart';

class ChangePlayerThemePage extends StatefulWidget {
  ChangePlayerThemePage({Key? key}) : super(key: key);

  @override
  _ChangePlayerThemePageState createState() => _ChangePlayerThemePageState();
}

class _ChangePlayerThemePageState extends State<ChangePlayerThemePage> {
  late BetterPlayerController _betterPlayerController;
  BetterPlayerDataSource? _dataSource;
  BetterPlayerTheme _playerTheme = BetterPlayerTheme.material;

  @override
  void initState() {
    super.initState();
    String url = Constants.bugBuckBunnyVideoUrl;
    _dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      url,
      /*  notificationConfiguration: BetterPlayerNotificationConfiguration(
        showNotification: true,
        title: "Elephant dream",
        author: "Some author",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/African_Bush_Elephant.jpg/1200px-African_Bush_Elephant.jpg",
        activityName: "MainActivity",
      ), */
    );
    _betterPlayerController = new BetterPlayerController(
      BetterPlayerConfiguration(
        autoDispose: true,
        autoPlay: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          playerTheme: _playerTheme,
        ),
      ),
      betterPlayerDataSource: _dataSource,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change player theme"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Player with the possibility to change the theme. Click on "
                "buttons below to change theme of player.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            BetterPlayer(
              controller: _betterPlayerController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  child: Text("MATERIAL"),
                  onPressed: () {
                    setState(() {
                      _playerTheme = BetterPlayerTheme.material;
                      _betterPlayerController.pause();
                      _betterPlayerController = new BetterPlayerController(
                        BetterPlayerConfiguration(
                          autoDispose: true,
                          autoDetectFullscreenDeviceOrientation: true,
                          autoDetectFullscreenAspectRatio: true,
                          controlsConfiguration:
                              BetterPlayerControlsConfiguration(
                            playerTheme: _playerTheme,
                            controlsHideTime: Duration(milliseconds: 100),
                            controlBarColor: Colors.black45,
                            /* 
                              backgroundColor: Colors.yellow,
                              overflowModalTextColor: Colors.cyan,
                              overflowMenuIconsColor: Colors.pink, 
                            */
                          ),
                        ),
                        betterPlayerDataSource: _dataSource,
                      );
                    });
                  },
                ),
                MaterialButton(
                  child: Text("CUPERTINO"),
                  onPressed: () {
                    setState(() {
                      _playerTheme = BetterPlayerTheme.cupertino;
                      _betterPlayerController.pause();
                      _betterPlayerController = new BetterPlayerController(
                        BetterPlayerConfiguration(
                          autoDispose: true,
                          controlsConfiguration:
                              BetterPlayerControlsConfiguration(
                            playerTheme: _playerTheme,
                            controlBarColor: Colors.black45,
                          ),
                        ),
                        betterPlayerDataSource: _dataSource,
                      );
                    });
                  },
                ),
                /* MaterialButton(
                  child: Text("CUSTOM"),
                  onPressed: () {
                    setState(() {
                      _playerTheme = BetterPlayerTheme.custom;
                      _betterPlayerController.pause();
                      _betterPlayerController = new BetterPlayerController(
                        BetterPlayerConfiguration(
                          autoDispose: true,
                          controlsConfiguration:
                              BetterPlayerControlsConfiguration(
                            playerTheme: _playerTheme,
                            customControlsBuilder: (controller) =>
                                CustomControlsWidget(
                              controller: controller,
                              /* onControlsVisibilityChanged:
                                  onControlsVisibilityChanged, */
                            ),
                          ),
                        ),
                        betterPlayerDataSource: _dataSource,
                      );
                    });
                  },
                ), */
              ],
            )
          ],
        ),
      ),
    );
  }
}
