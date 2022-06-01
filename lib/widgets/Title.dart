import 'package:flutter/material.dart';

class CreateTitle extends StatelessWidget {
  const CreateTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('No Problems',
        style: TextStyle(
            // color: Colors.grey[800],
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
            fontSize: 32));
  }
}
