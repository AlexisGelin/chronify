import 'package:flutter/material.dart';

class PlayTime extends StatelessWidget {
  const PlayTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('00:00',
        style: TextStyle(
            // color: Colors.grey[800],
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
            fontSize: 16))
    );
  }
}