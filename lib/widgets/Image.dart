import 'package:flutter/material.dart';

class CreateImage extends StatelessWidget {
  const CreateImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/images/NoProblems.jpg',
      ),
    );
  }
}
