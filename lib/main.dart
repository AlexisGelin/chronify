import 'package:chronify/models/song.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chronify',
      theme: ThemeData.dark(),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const MyHomePage(title: "Chronify"),
      duration: 3000,
      imageSize: 200,
      imageSrc: "assets/images/time.png",
      backgroundColor: Theme.of(context).colorScheme.secondary,
    );
  }
}

//////////////////////// HOME PAGE

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  double _currentSliderValue = 0;
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();

  void changeSong(int i) {
    index += i;
    setState(() {});
    if (index <= -1) {
      index = playlist.length - 1;
    }
    if (index >= playlist.length) {
      index = 0;
    }
    assetsAudioPlayer.open(Audio(playlist[index].songPath));
  }

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(Audio(playlist[index].songPath), autoStart: false);
  }

  @override
  Widget build(BuildContext context) {
    assetsAudioPlayer.playlistAudioFinished.listen((Playing playing) {
      changeSong(0);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ////////////////////////Image

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                playlist[index].imagePath,
              ),
            ),

            ////////////////////////Title

            Text(playlist[index].title,
                style: const TextStyle(
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold,
                    fontSize: 32)),

            /////////////////////////Author

            Text(playlist[index].author,
                style: const TextStyle(fontFamily: 'Lexend', fontSize: 16)),

            ////////////////////////Playtime

            Padding(
              padding: EdgeInsets.all(16.0),
              child: assetsAudioPlayer.builderRealtimePlayingInfos(
                  builder: (context, RealtimePlayingInfos? infos) {
                return Text(
                    "${formatDate(DateTime(0, 0, 0, 0, 0, assetsAudioPlayer.currentPosition.value.inSeconds), [
                          nn,
                          ':',
                          ss
                        ])} / ${formatDate(DateTime(0, 0, 0, 0, 0, infos!.duration.inSeconds), [
                          nn,
                          ':',
                          ss
                        ])}",
                    style: const TextStyle(
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold,
                        fontSize: 16));
              }),
            ),

            ////////////////////////Slider

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: assetsAudioPlayer.builderRealtimePlayingInfos(
                  builder: (context, RealtimePlayingInfos? infos) {
                double _value = assetsAudioPlayer
                    .currentPosition.value.inSeconds
                    .toDouble();
                return Slider(
                  value: _value,
                  min: 0,
                  max: infos!.duration.inSeconds.toDouble(),
                  activeColor: Theme.of(context).colorScheme.secondary,
                  inactiveColor: Theme.of(context).colorScheme.background,
                  thumbColor: Theme.of(context).colorScheme.secondary,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      value = assetsAudioPlayer
                          .seek(Duration(seconds: value.toInt())) as double;
                    });
                  },
                );
              }),
            ),

            ////////////////////////Icones

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      iconSize: 60,
                      icon: const Icon(Icons.keyboard_double_arrow_left),
                      onPressed: () {
                        changeSong(-1);
                        isPlaying = true;
                      }),
                  IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.replay_10_sharp),
                      onPressed: () {
                        assetsAudioPlayer.seekBy(const Duration(seconds: -10));
                      }),
                  IconButton(
                      iconSize: 60,
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        if (isPlaying) {
                          assetsAudioPlayer.pause();
                        } else {
                          assetsAudioPlayer.play();
                        }
                        isPlaying = !isPlaying;
                        setState(() {});
                      }),
                  IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.forward_10_sharp),
                      onPressed: () {
                        assetsAudioPlayer.seekBy(const Duration(seconds: 10));
                      }),
                  IconButton(
                      iconSize: 60,
                      icon: const Icon(Icons.keyboard_double_arrow_right),
                      onPressed: () {
                        changeSong(1);
                        isPlaying = true;
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Song> playlist = [
  Song("assets/images/NoProblems.jpg", "No Problems", "DJ Cruz",
      "assets/audio/NoProblems.mp3"),
  Song("assets/images/SoundsGood.png", "Sounds Good", "Roxe",
      "assets/audio/SoundsGood.mp3"),
  Song("assets/images/Slipping.jpg", "Slipping", "Broshi",
      "assets/audio/Slipping.mp3")
];
