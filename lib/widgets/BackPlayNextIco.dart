import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

AssetsAudioPlayer audioPlayer = AssetsAudioPlayer(); // this will create a instance object of a class
bool isPlaying = false;

class CreateAllIcon extends StatefulWidget {
  const CreateAllIcon({Key? key}) : super(key: key);

  @override
  State<CreateAllIcon> createState() => _CreateAllIcon();
}

class _CreateAllIcon extends State<CreateAllIcon> {
  double _currentSliderValue = 0;


  void playOrPause() {
    audioPlayer.playOrPause();
  }

 @override
  Widget build(BuildContext context) {
    audioPlayer.open(Audio('assets/audio/Slipping.mp3'),
        autoStart: false, showNotification: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              iconSize: 70,
              icon: const Icon(Icons.keyboard_double_arrow_left),
              onPressed: () {}),
          IconButton(
              iconSize: 70,
              icon: Icon(isPlaying ? Icons.play_arrow : Icons.pause),
              onPressed: () {
                playOrPause();
                isPlaying = !isPlaying;
              }),
          IconButton(
              iconSize: 70,
              icon: const Icon(Icons.keyboard_double_arrow_right),
              onPressed: () {}),
        ],
      ),
    );
  }
}
