import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer player = AudioPlayer();

class AllIcon extends StatelessWidget {
  const AllIcon({
    Key? key,
  }) : super(key: key);

  Future toggleSound() async {
    int result = await player.play('assets/audio/No_Problems_Tom_Budin_Remix.mp3', isLocal: true);
    if (result == 1) {
      // success
    }
  }

  @override
  Widget build(BuildContext context) {
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
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                toggleSound();
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
